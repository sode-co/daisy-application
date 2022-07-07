import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/work_space/deps/workspace_listener.dart';
import 'package:daisy_application/app/pages/work_space/model/workspace_screen_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
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

  @override
  void initState() {
    _projectRestApi = locator.get();
    _requestRestApi = locator.get();
    _screenState = WorkSpaceScreenState();
    Future.sync(() async => await onSelectedTabChanged(2));
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
  Future<void> onSelectedTabChanged(int tabIndex) async {
    if (tabIndex == 0 && _screenState!.allPendingRequests.isEmpty) {
      final result =
          await _requestRestApi.getAppliedRequest().Value<List<RequestModel>>();
      _errorHandling(result);

      _screenState!.allPendingRequests = result.data!;
    }

    if (tabIndex == 1 && _screenState!.allProjects.isEmpty) {
      final result = await _projectRestApi.getAll().Value<List<ProjectModel>>();
      _errorHandling(result);

      _screenState!.allProjects = result.data!;
    }

    if (tabIndex == 2 && _screenState!.activeProjects.isEmpty) {
      _screenState!.activeProjects =
          await _fetchProjectByStatus(ProjectStatus.IN_PROGRESS);
    }

    if (tabIndex == 3 && _screenState!.doneProjects.isEmpty) {
      _screenState!.doneProjects =
          await _fetchProjectByStatus(ProjectStatus.DONE);
    }

    if (tabIndex == 4 && _screenState!.canceledProjects.isEmpty) {
      _screenState!.canceledProjects =
          await _fetchProjectByStatus(ProjectStatus.CANCELED);
    }

    _screenState!.activeTab = tabIndex;
  }
}
