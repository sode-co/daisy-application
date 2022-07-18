import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';
import 'package:daisy_application/app/pages/work_space/view/workspace_common.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/common/name_to_enum.dart';
import 'package:daisy_application/common/to_string_utils.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

extension ItemRequest on WorkspaceState {
  Widget createRequestInfoCard(RequestModel request) {
    final currentStatus = request.status!.toRequestStatus();
    final tagName = DisplayName.fromRequestStatus(
        request.status!.toRequestStatus(), currentUser.role!.toUserRole());
    final buttonColor = currentStatus == RequestStatus.AVAILABLE
        ? Design.accentRed.shade400
        : Colors.black45;
    const buttonName = 'Xem đơn';
    WorkspaceCardInfo cardInfo = WorkspaceCardInfo(
      title: request.title,
      buttonColor: buttonColor,
      tagName: tagName,
      image: '',
      authorAvatar: request.customer?.avatar ?? '',
      isDisplayButton: currentStatus != RequestStatus.TAKEN,
      authorName:
          request.customer?.displayName ?? request.customer?.lastName ?? '',
      buttonName: buttonName,
      onMainBtnClicked: () {
        Debug.log('Xem ddonw');
      },
    );

    return createInfoCard(cardInfo);
  }
}
