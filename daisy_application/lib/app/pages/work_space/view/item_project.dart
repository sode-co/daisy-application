import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/to_string_utils.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/common/name_to_enum.dart';

extension ItemProject on WorkspaceState {
  Widget createProjectInfoCard(ProjectModel project) {
    final currentStatus = project.status!.toProjectStatus();
    final buttonColor = currentStatus != ProjectStatus.DONE
        ? currentStatus == ProjectStatus.CANCELED
            ? Colors.black45
            : Design.colorPrimary
        : Design.accentRed.shade400;
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: LayoutBuilder(builder: (context, constraint) {
            return Padding(
              padding: const EdgeInsets.all(Design.itemSpacing),
              child: SizedBox(
                width: size.width * 0.9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    createProjectItemImage(constraint),
                    const SizedBox(width: Design.bodySpacing),
                    createProjectInfo(project, buttonColor),
                    Expanded(child: Container()),
                    createButton(project, buttonColor)
                  ],
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: Design.headerSpacing),
        createItemDivider()
      ],
    );
  }

  Widget createButton(ProjectModel project, Color color) {
    final isDisplayed = project.status! != ProjectStatus.CANCELED.name;
    final buttonText =
        project.status!.toProjectStatus() == ProjectStatus.IN_PROGRESS
            ? 'Get started'
            : 'View';

    return isDisplayed
        ? SizedBox(
            height: 45,
            width: 180,
            child: createItemButton(
              buttonText: buttonText,
              buttonColor: color,
            ))
        : Container();
  }

  Widget createProjectItemImage(BoxConstraints constraint) => Container(
        width: constraint.maxWidth * 0.2,
        padding: EdgeInsets.all(constraint.maxWidth * 0.2 * 0.1),
        decoration: BoxDecoration(
            color: Design.colorWhite,
            border:
                Border.all(color: Design.colorNeutral.shade400, width: 0.8)),
        child: Image.asset(
          'assets/images/portfolio/avatar.png',
        ),
      );

  Widget createProjectInfo(ProjectModel project, Color tagColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${project.name}',
          style: Design.textBody(bold: true),
        ),
        const SizedBox(height: Design.itemSpacing),
        Row(
          children: [
            SizedBox(
              width: Design.textTitle().fontSize,
              child: CircleAvatar(
                backgroundImage: NetworkImage(project.customer!.avatar!),
              ),
            ),
            const SizedBox(
              width: Design.contentSpacing,
            ),
            Text(
              project.customer?.displayName ??
                  project.customer?.firstName ??
                  '',
              style: Design.textName(),
            )
          ],
        ),
        const SizedBox(height: 5.0),
        Text('', style: Design.textBody()),
        const SizedBox(height: 10.0),
        createItemTag(
            DisplayName.fromProjectStatus(project.status!.toProjectStatus(),
                currentUser.role!.toUserRole()),
            tagColor)
      ],
    );
  }

  Widget createItemTag(String status, Color color) => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            border: Border.all(color: color, width: 3)),
        child: Text(
          status,
          style: Design.textButtonSmall(textColor: color),
        ),
      );
}
