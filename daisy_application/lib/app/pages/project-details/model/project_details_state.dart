import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

class ProjectDetailsState with ChangeNotifier {
  RequestModel request = RequestModel();
  ProjectModel? project = ProjectModel(name: 'Sode');
  List<DiscussionModel> discussions = [
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
}
