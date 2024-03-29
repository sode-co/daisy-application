import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/app/dialogs/alert_dialog.dart';
import 'package:daisy_application/app/pages/project-details/deps/project_details_listener.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:daisy_application/app/router/router.gr.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/config.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/common/platform_helper.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/grpc/discussions/discussions_grpc_client.dart';
import 'package:daisy_application/core_services/grpc/file_transfer/file_streaming_grpc_client.dart';
import 'package:daisy_application/core_services/grpc/resource/resource_grpc_client.dart';
import 'package:daisy_application/core_services/http/project/project_rest_api.dart';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/core_services/http/payment/payment_rest_api.dart';
import 'package:daisy_application/core_services/models/payments/momo_model.dart';
import 'package:daisy_application/core_services/models/payments/payment_model.dart';
import 'package:daisy_application/core_services/socket/discussions/discussion_signalr_client.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daisy_application/core_services/momo/momo_redirect_native.dart'
    if (dart.library.html) 'package:daisy_application/core_services/momo/momo_redirect_web.dart'
    as universal_redirect;

class ProjectDetailsFlowController extends AutoRouter {
  final String projectId;

  const ProjectDetailsFlowController(@PathParam() this.projectId, {Key? key})
      : super(key: key);

  @override
  AutoRouterState createState() => _ProjectDetailsFlowControllerState();
}

class _ProjectDetailsFlowControllerState extends AutoRouterState
    implements ProjectDetailsListener<AutoRouter> {
  ProjectDetailsState? projectDetailsState;
  late ProjectRestApi projectApiSerivce;
  late DiscussionsGrpcClient _discussionsGrpcService;
  late DiscussionSignalRClient _discussionRealtimeService;
  late ResourceGrpcClient _resourceGrpcService;
  late FileStreamingGrpcClient _fileResourceService;
  late PaymentRestApi _paymentService;

  ProjectDetailsFlowController get myWidget =>
      widget as ProjectDetailsFlowController;

  @override
  void initState() {
    super.initState();
    _discussionsGrpcService = locator.get();
    projectApiSerivce = locator.get();
    _paymentService = locator.get();
    projectDetailsState = ProjectDetailsState();
    _discussionRealtimeService = locator.get();
    _resourceGrpcService = locator.get();
    _fileResourceService = locator.get();
    loadProject();
    onFileNavTabSelected(0);
  }

  ApplicationState get appState => context.read();

  Future<void> loadProject() async {
    ProjectDetailsRoute(projectId: '');
    var result = await projectApiSerivce.getById(myWidget.projectId).Value();
    if (result.failureType == FAILURE_TYPE.NONE) {
      projectDetailsState!.project = result.data;
      _discussionRealtimeService.workspace =
          projectDetailsState!.project!.workspaces.first;
      Debug.log('project-screen', 'load project success', result.data);

      await _discussionRealtimeService.connect();
      streamingDiscussion();
    } else {
      Debug.log(
          'project-screen', 'load project failed with failure error', result);
    }
  }

  Future<void> streamingDiscussion() async {
    await for (var discussion
        in _discussionRealtimeService.streamNewMessages()) {
      projectDetailsState!.addDiscussions([discussion]);
    }
  }

  @override
  void dispose() {
    _discussionRealtimeService.end();
    // projectDetailsState = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProjectDetailsState>(
            create: (ctx) => projectDetailsState!)
      ],
      child: super.build(context),
    );
  }

  @override
  void onFileNavTabSelected(int index) =>
      _loadResource(projectDetailsState!.currentProjectTab);

  Future<void> _loadResource(ProjectFileTab tab) async {
    if (tab.resources.isNotEmpty) {
      return;
    }
    await for (var response in _resourceGrpcService.streamingResource(
      tab.fileType!.name,
      projectDetailsState!.project!.workspaces.first.id!,
      DateTime.now().millisecondsSinceEpoch,
    )) {
      projectDetailsState!.addResources([response]);
    }

    await _loadResourceBinary();
  }

  Future<void> _loadResourceBinary() async {
    final resourceKeys = projectDetailsState!.currentProjectTab.resources
        .map((e) => e.resourceKey!)
        .toList();

    await for (var data
        in _fileResourceService.streamBinaryResource(resourceKeys)) {
      projectDetailsState!
          .appendBinaryResource(data.binary, data.resourceKey, data.status);
    }
  }

  @override
  Future<void> onLoadMoreDicussion() async {
    if (projectDetailsState == null &&
        projectDetailsState!.isDiscussionLoading) {
      return;
    }

    projectDetailsState!.isDiscussionLoading = true;
    await for (var discussion in _discussionsGrpcService.fetchingDiscussions(
      projectDetailsState!.project!.workspaces.first.id.toString(),
      timeOffset: projectDetailsState!.discussions.isNotEmpty
          ? projectDetailsState!
              .discussions.last.createdAt!.millisecondsSinceEpoch
          : DateTime.now().millisecondsSinceEpoch,
    )) {
      projectDetailsState!.addDiscussions(discussion.data!);
    }

    projectDetailsState!.isDiscussionLoading = false;
  }

  @override
  Future<void> onBtnSendDiscussion(String discussion) async {
    final newDiscussion = DiscussionModel(
        content: discussion,
        sender: appState.currentUser!,
        workspace: projectDetailsState!.project!.workspaces.first,
        type: 'text/plain');

    await _discussionRealtimeService.sendMessage(newDiscussion);
  }

  @override
  Future<void> onBtnCompleteProjectClicked() async {
    context.show(DialogAlert.info(context,
        message:
            'Are  you really want to complete this project, by pressing aggree you must pay all of the fee to complete this project',
        affirmativeText: 'Aggree',
        negativeText: 'No I don\'t want to complete this job',
        onAffirmativeClicked: () => makePayment()));
  }

  Future<void> makePayment() async {
    PaymentModel payment = projectDetailsState!.project!.payment!;
    final ns = 'payment-${payment.id}p';
    final result = await _paymentService.createTransaction({
      'redirectUrl': PlatformHelper.isPlatform(Platform.Android)
          ? 'mobile://android.daisy'
          : '${Config.WEB_URL}/#/project/${projectDetailsState!.project!.id!}',
      'paymentId': payment.id
    }).Value<MomoModel>();

    Debug.log(
        ns, 'create transaction with result', result.failureType, result.data);

    if (result.failureType != FAILURE_TYPE.NONE) {
      context.toastError('Payment failed can not create transaction');
      return;
    }

    await universal_redirect.redirect(result.data!.paymentRedirectUrl!);
  }
}
