import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';
import 'package:daisy_application/app/pages/work_space/view/workspace_common.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/to_string_utils.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/common/name_to_enum.dart';

extension ItemProject on WorkspaceState {
  Widget createProjectInfoCard(ProjectModel project) {
    final currentStatus = project.status!.toProjectStatus();
    final tagName = DisplayName.fromProjectStatus(
        project.status!.toProjectStatus(), currentUser.role!.toUserRole());
    final buttonColor = currentStatus != ProjectStatus.DONE
        ? currentStatus == ProjectStatus.CANCELED
            ? Colors.black45
            : Design.colorPrimary
        : Design.accentRed.shade400;
    final buttonName =
        project.status!.toProjectStatus() == ProjectStatus.IN_PROGRESS
            ? 'Get started'
            : 'View';
    WorkspaceCardInfo cardInfo = WorkspaceCardInfo(
        title: project.name,
        buttonColor: buttonColor,
        tagName: tagName,
        image: '',
        authorAvatar: project.customer?.avatar ?? '',
        isDisplayButton: currentStatus != ProjectStatus.CANCELED,
        authorName:
            project.customer?.displayName ?? project.customer?.lastName ?? '',
        buttonName: buttonName);

    return createInfoCard(cardInfo);
  }
}
