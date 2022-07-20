import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:flutter/material.dart';

class ProjectFileTab {
  final String? title;
  final ResourceWorkStatus? fileType;
  final List<ResourceModel> _resources = [];

  ProjectFileTab({this.title, this.fileType});

  List<ResourceModel> get resources => _resources;

  void addResources(List<ResourceModel> resources) {
    _resources
      ..addAll(resources)
      ..sort(((a, b) =>
          b.createdAt!.millisecondsSinceEpoch -
          a.createdAt!.millisecondsSinceEpoch));
  }
}

class ProjectDetailsState with ChangeNotifier {
  bool isDiscussionLoading = false;
  RequestModel request = RequestModel();
  ProjectModel? _project =
      ProjectModel(name: 'Sode', workspaces: [WorkspaceModel(id: 1)]);
  final List<ProjectFileTab> fileTabs = [];

  ProjectDetailsState() {
    fileTabs.addAll([
      ProjectFileTab(
          fileType: ResourceWorkStatus.IN_PROGRESS, title: 'In progress'),
      ProjectFileTab(fileType: ResourceWorkStatus.DECLINED, title: 'Declined'),
      ProjectFileTab(fileType: ResourceWorkStatus.FINAL, title: 'Final'),
    ]);
  }

  set project(ProjectModel? project) {
    _project = project;
    notifyListeners();
  }

  void addResources(List<ResourceModel> resources) {
    currentProjectTab.addResources(resources);
    notifyListeners();
  }

  ProjectModel? get project => _project;

  final List<DiscussionModel> _discussions = [];

  List<DiscussionModel> get discussions => _discussions;

  int _currentFileTabIndex = 0;

  set currentFileTabIndex(int value) {
    _currentFileTabIndex = value;
    notifyListeners();
  }

  ProjectFileTab get currentProjectTab => fileTabs[_currentFileTabIndex];

  int get currentFileTabIndex => _currentFileTabIndex;

  void addDiscussions(List<DiscussionModel> discussions) {
    _discussions
      ..addAll(discussions)
      ..sort(((a, b) =>
          b.createdAt!.millisecondsSinceEpoch -
          a.createdAt!.millisecondsSinceEpoch));

    notifyListeners();
  }
}
