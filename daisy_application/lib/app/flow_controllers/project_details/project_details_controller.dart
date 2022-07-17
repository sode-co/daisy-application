import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/project-details/deps/project_details_listener.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/grpc/discussions/discussions_grpc_client.dart';
import 'package:daisy_application/core_services/http/project/project_rest_api.dart';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/socket/discussions/discussion_signalr_client.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  ProjectDetailsFlowController get myWidget =>
      widget as ProjectDetailsFlowController;

  @override
  void initState() {
    super.initState();
    _discussionsGrpcService = locator.get();
    projectApiSerivce = locator.get();
    projectDetailsState = ProjectDetailsState();
    _discussionRealtimeService = locator.get();
    loadProject();
  }

  ApplicationState get appState => context.read();

  Future<void> loadProject() async {
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
  void onFileNavTabSelected(int index) {
    // TODO: implement onFileNavTabSelected
  }

  @override
  Future<void> onLoadMoreDicussion() async {
    Debug.log('loadmore disuccsison');
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
}
