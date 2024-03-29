import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

abstract class DiscoveryJobListener<T extends StatefulWidget>
    implements State<T> {
  void onLoadMoreRequest();
  void onBtnApplyClicked();
  void onBtnConfirmApplyClicked(UserModel user, String description);
  void onLoadListApplicants(int? requestId);
  void onBtnApproveJobApplication(
      RequestModel? request, int requestId, String freelancerEmail);
  void getPortfolioByDesignerEmail(String designerEmail);
}
