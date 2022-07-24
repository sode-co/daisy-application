import 'package:daisy_application/app/pages/work_space/model/workspace_tabs.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class WorkSpaceScreenState with ChangeNotifier {
  List<RequestModel> allPostedRequests = [];
  List<RequestModel> allPendingRequests = [];
  List<ProjectModel> activeProjects = [];
  List<ProjectModel> canceledProjects = [];
  List<ProjectModel> allProjects = [];
  List<ProjectModel> doneProjects = [];

  late WorkspaceTab _activeTabIndex = WorkspaceTab.ActiveProjects;

  WorkspaceTab get activeTab => _activeTabIndex;

  set activeTab(WorkspaceTab tab) {
    _activeTabIndex = tab;
    notifyListeners();
  }
}
