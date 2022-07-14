import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/list_utils.dart';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:flutter/material.dart';

class ProjectFileTab {
  final String? title;
  final ResourceWorkStatus? fileType;
  final List<ResourceModel> resources;

  ProjectFileTab({this.title, this.fileType, this.resources = const []});
}

class ProjectDetailsState with ChangeNotifier {
  RequestModel request = RequestModel();
  ProjectModel? project =
      ProjectModel(name: 'Sode', workspaces: [WorkspaceModel(id: 1)]);
  final List<ProjectFileTab> fileTabs = [
    ProjectFileTab(
        fileType: ResourceWorkStatus.IN_PROGRESS,
        title: 'In progress',
        resources: []),
    ProjectFileTab(
        fileType: ResourceWorkStatus.DECLINED,
        title: 'Declined',
        resources: []),
    ProjectFileTab(
        fileType: ResourceWorkStatus.FINAL, title: 'Final', resources: []),
  ];

  final List<DiscussionModel> _discussions = [
    DiscussionModel(
        sender: UserModel(
            null, null, null, 'TienDang', null, null, null, null, null, null),
        createdAt: DateTime.now(),
        content: 'Hi how are you ?'),
    DiscussionModel(
        sender: UserModel(
            null, null, null, 'TienDang', null, null, null, null, null, null),
        createdAt: DateTime.now(),
        content: 'Hi how are you ?'),
    DiscussionModel(
        sender: UserModel(
            null, null, null, 'TienDang', null, null, null, null, null, null),
        createdAt: DateTime.now(),
        content: 'Hi how are you ?'),
  ];

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
      ..removeWhere((a) => _discussions.find((b) => b.id == a.id) != null)
      ..sort(((a, b) =>
          b.createdAt!.millisecondsSinceEpoch -
          a.createdAt!.millisecondsSinceEpoch));

    notifyListeners();
  }
}
