import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/dialogs/alert_dialog.dart';
import 'package:daisy_application/app/dialogs/job_apply_dialog.dart';
import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/discovery-job/deps/discovery_job_page_deps.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/app/router/router.gr.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/common/safety_utils.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/grpc/request/request_grpc_client.dart';
import 'package:daisy_application/core_services/http/job_application/job_application_rest_api.dart';
import 'package:daisy_application/core_services/models/job_application/job_application_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DicoveryJobFlowController extends FlowController {
  const DicoveryJobFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _DiscoveryJobFlowControllerState();
}

class _DiscoveryJobFlowControllerState extends FlowControllerState
    implements DiscoveryJobListener<AutoRouter> {
  late RequestGrpcClient _requestGrpcClient;
  late JobApplicationRestApi _applicationRestApi;

  DiscoveryJobScreenState? _jobScreenState;

  @override
  void initState() {
    super.initState();
    _jobScreenState = DiscoveryJobScreenState();
    _applicationRestApi = locator.get();
    _requestGrpcClient = locator.get();
  }

  @override
  void dispose() {
    super.dispose();
    _jobScreenState = null;
  }

  ApplicationState get _appState => context.read();
  HeaderAuthenticationListener get _authListener =>
      context.findAncestorStateOfType()!;

  @override
  void onLoadMoreRequest() => _loadMoreRequest();

  Future<void> _loadMoreRequest() async {
    if (_jobScreenState != null && _jobScreenState!.isRequestLoading) return;

    _jobScreenState?.isRequestLoading = true;
    const ns = 'load-more-request';
    Debug.log(ns, 'Start streaming request');
    final lastLoadedRequestTimeStamp = _jobScreenState!.requests.isNotEmpty
        ? _jobScreenState!.requests.last.createdAt!.millisecondsSinceEpoch
        : DateTime.now().millisecondsSinceEpoch;

    await for (var singleResult in _requestGrpcClient.startStreamingRequests(
        timeOffset: lastLoadedRequestTimeStamp)) {
      if (singleResult.failureType == FAILURE_TYPE.NONE) {
        _jobScreenState?.addRequests(singleResult.data!);
      }
    }

    _jobScreenState?.isRequestLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => _jobScreenState)],
      child: super.build(context),
    );
  }

  @override
  void onBtnApplyClicked() {
    final currentUser = _appState.currentUser;
    if (currentUser == null) {
      context.show(DialogAlert.error(
        context,
        title: 'Ứng tuyển thất bại',
        message:
            'Việc ứng tuyển yêau cầu phải xác minh danh tính, vui lòng hãy đăng nhập trước khi gửi yêu cầu ứng tuyển.',
        affirmativeText: 'Login now',
        negativeText: 'Not now',
        onAffirmativeClicked: _onLoginDialogAffirmativeClicked,
        onNegativeClicked: _closePopup,
      ));

      return;
    }

    if ((currentUser.lastName.isBlank() && currentUser.firstName.isBlank()) ||
        currentUser.email.isBlank() ||
        currentUser.phone.isBlank()) {
      context.show(DialogAlert.error(
        context,
        title: 'Ứng tuyển thất bại',
        message:
            'Chúng tôi cần thêm thông tin để có thể thực hiện việc ứng tuyển, vui lòng bổ sung thêm',
        affirmativeText: 'Update info now',
        negativeText: 'Not now',
        onAffirmativeClicked: () {
          context.pushRoute(const UpdateProfileRoute());
          _closePopup();
        },
        onNegativeClicked: _closePopup,
      ));

      return;
    }

    context.show(
      JobApplyDialog(
          context,
          _jobScreenState?.selectedRequest ?? _jobScreenState!.requests[0],
          _appState.currentUser!,
          onBtnConfirmApplyClicked),
    );
  }

  void _onLoginDialogAffirmativeClicked() {
    Navigator.of(context, rootNavigator: true).pop();
    _authListener.onBtnSigninClicked();
  }

  void _closePopup() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void onBtnConfirmApplyClicked(UserModel user, String description) =>
      _createApplication(description);

  Future<void> _createApplication(String description) async {
    const ns = 'post-job-application';
    Debug.log(ns, 'send job application with body', _appState.currentUser,
        _jobScreenState?.selectedRequest, description);

    final result = await _applicationRestApi
        .create(JobApplicationModel(
            description:
                description.isEmpty ? DEFAULT_APPLICATION_MESSAGE : description,
            freelancer: _appState.currentUser,
            request: _jobScreenState!.selectedRequest!))
        .Value();

    if (result.failureType == FAILURE_TYPE.NONE) {
      // close the dialog when sending success
      Navigator.of(context, rootNavigator: true).pop();
      context.toastSuccess('Nộp đơn thành công');
    } else {
      context
          .toastError('Nộp đơn thất bại, có lỗi trong quá trình gửi dữ liệu');
    }
  }

  @override
  void onLoadListApplicants() => getListApplicants();

  Future<void> getListApplicants() async {
    const ns = 'discovery-page';
    Debug.log(ns, 'get list applicants', _appState.currentUser,
        _jobScreenState?.selectedRequest);
    final result = await _applicationRestApi.GetApplicantsOfRequest(
        _jobScreenState?.selectedRequest?.id ??
            _jobScreenState!.requests[0].id!);
    _jobScreenState!.applicants = result.data;
  }

  @override
  void onBtnApproveJobApplication(int requestId, String freelancerEmail) =>
      approveJobApplication(requestId, freelancerEmail);

  Future<void> approveJobApplication(
      int requestId, String freelancerEmail) async {
    const ns = 'discovery-page';
    Debug.log('on approve list candidate');
    await _applicationRestApi.approveApplication(requestId, freelancerEmail);
  }
}
