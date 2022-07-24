import 'package:daisy_application/app/pages/work_space/model/workspace_tabs.dart';
import 'package:flutter/material.dart';

abstract class WorkSpaceListener<T extends StatefulWidget> implements State<T> {
  Future<void> onSelectedTabChanged(WorkspaceTab tab);
  void onLoadListApplicants(int? requestId);
  void onBtnApproveJobApplication(int requestId, String freelancerEmail);
}
