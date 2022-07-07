import 'package:daisy_application/app/pages/admin/project-management/view/body.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class WorkSpaceScreenState with ChangeNotifier {
  List<RequestModel> allPendingRequests = [];
  List<ProjectModel> activeProjects = [];
  List<ProjectModel> canceledProjects = [];
  List<ProjectModel> allProjects = [];
  List<ProjectModel> doneProjects = [];

  late int _activeTabIndex = 0;

  int get activeTab => _activeTabIndex;

  set activeTab(int tab) {
    _activeTabIndex = tab;
    notifyListeners();
  }
}
