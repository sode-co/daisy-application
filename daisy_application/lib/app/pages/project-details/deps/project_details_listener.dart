import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:flutter/material.dart';

abstract class ProjectDetailsListener<T extends StatefulWidget>
    implements State<T> {
  void onFileNavTabSelected(int index);
  Future<void> onLoadMoreDicussion();
  Future<void> onBtnSendDiscussion(String discussion);
  Future<void> onBtnCompleteProjectClicked();
}
