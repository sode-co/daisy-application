import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/app/pages/work_space/deps/workspace_listener.dart';
import 'package:daisy_application/app/pages/work_space/model/workspace_screen_state.dart';
import 'package:daisy_application/app/pages/work_space/model/workspace_tabs.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/common/math_utils.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/http/job_application/job_application_rest_api.dart';
import 'package:daisy_application/core_services/http/project/project_rest_api.dart';
import 'package:daisy_application/core_services/http/request/request_rest_api.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkSpaceFlowController extends FlowController {
  const WorkSpaceFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _WorkSpaceFlowControllerState();
}

class _WorkSpaceFlowControllerState extends FlowControllerState
    implements WorkSpaceListener<AutoRouter> {
  WorkSpaceScreenState? _screenState;
  late ProjectRestApi _projectRestApi;
  late RequestRestApi _requestRestApi;
  late JobApplicationRestApi _applicationRestApi;
  DiscoveryJobScreenState? _jobScreenState;

  @override
  void initState() {
    _projectRestApi = locator.get();
    _requestRestApi = locator.get();
    _applicationRestApi = locator.get();

    _screenState = WorkSpaceScreenState();
    _jobScreenState = DiscoveryJobScreenState();
    Future.sync(
        () async => await onSelectedTabChanged(WorkspaceTab.ActiveProjects));
    super.initState();
  }

  @override
  void dispose() {
    _screenState = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => _screenState)],
      child: super.build(context),
    );
  }

  Future<List<ProjectModel>> _fetchProjectByStatus(ProjectStatus status) async {
    final result = await _projectRestApi
        .getByStatus(status.name)
        .Value<List<ProjectModel>>();
    _errorHandling(result);
    return result.data!;
  }

  void _errorHandling(Result result) {
    if (result.failureType != FAILURE_TYPE.NONE) {
      context.toastError('Something wrong happen, please try again.');
    }
  }

  @override
  Future<void> onSelectedTabChanged(WorkspaceTab tab) async {
    if (tab == WorkspaceTab.PostedRequest &&
        _screenState!.allPostedRequests.isEmpty) {
      final result = await _requestRestApi.getAll().Value<List<RequestModel>>();
      _errorHandling(result);

      _screenState!.allPostedRequests = result.data!
          .getRange(0, limit(result.data!.length, max: 30))
          .toList();
    }
    if (tab == WorkspaceTab.AppliedRequest &&
        _screenState!.allPendingRequests.isEmpty) {
      final result =
          await _requestRestApi.getAppliedRequest().Value<List<RequestModel>>();
      _errorHandling(result);

      _screenState!.allPendingRequests = result.data!
          .getRange(0, limit(result.data!.length, max: 30))
          .toList();
    }

    if (tab == WorkspaceTab.AllProjects && _screenState!.allProjects.isEmpty) {
      final result = await _projectRestApi.getAll().Value<List<ProjectModel>>();
      _errorHandling(result);

      _screenState!.allProjects = result.data!
          .getRange(0, limit(result.data!.length, max: 30))
          .toList();
    }

    if (tab == WorkspaceTab.ActiveProjects &&
        _screenState!.activeProjects.isEmpty) {
      _screenState!.activeProjects =
          await _fetchProjectByStatus(ProjectStatus.IN_PROGRESS);
    }

    if (tab == WorkspaceTab.DoneProjects &&
        _screenState!.doneProjects.isEmpty) {
      _screenState!.doneProjects =
          (await _fetchProjectByStatus(ProjectStatus.DONE));
    }

    if (tab == WorkspaceTab.CanceledProjects &&
        _screenState!.canceledProjects.isEmpty) {
      _screenState!.canceledProjects =
          await _fetchProjectByStatus(ProjectStatus.CANCELED);
    }

    _screenState!.activeTab = tab;
  }

  ApplicationState get _appState => context.read();

  @override
  void onLoadListApplicants(int? requestId) => getListApplicants(requestId);

  Future<void> getListApplicants(int? requestId) async {
    const ns = 'discovery-page';
    Debug.log(ns, 'get list applicants', _appState.currentUser,
        _jobScreenState?.selectedRequest);
    final result =
        await _applicationRestApi.GetApplicantsOfRequest(requestId).Value();
    if (result.failureType == FAILURE_TYPE.NONE) {
      _jobScreenState!.applicants = result.data;
    }
  }

  @override
  void onBtnApproveJobApplication(int requestId, String freelancerEmail) =>
      approveJobApplication(requestId, freelancerEmail);

  Future<void> approveJobApplication(
      int requestId, String freelancerEmail) async {
    await _applicationRestApi.approveApplication(requestId, freelancerEmail);
    context.toastSuccess('Duyệt đơn ứng tuyển thành công');
  }
}
