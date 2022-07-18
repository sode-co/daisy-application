import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ProjectHeader on ProjectDetailsPageState {
  Widget createHeader() {
    ProjectModel? project = screenState.project;
    final currentTime = DateFormat('hh:mm a').format(DateTime.now());
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            project?.name ?? 'loading...',
            style:
                Design.textSmallLogo(isMobile: !Responsive.isDesktop(context)),
          ),
          const SizedBox(height: Design.contentSpacing),
          Row(
            children: [
              createItemTag(project?.category?.name ?? 'loading...',
                  Design.primaryTextColor),
              const SizedBox(width: Design.contentSpacing),
              createItemTag('In Progress', Design.accentRed.shade400),
              const SizedBox(width: Design.contentSpacing),
              Text(
                  'with ${project?.customer?.displayName ?? project?.customer?.firstName ?? 'loading...'}',
                  style: Design.textCaption()),
              if (Responsive.isDesktop(context))
                Text(' Local time: $currentTime',
                    style: Design.textCaption(
                      textColor: Design.colorNeutral.shade600,
                    ))
            ],
          ),
        ],
      ),
    );
  }

  Widget createItemTag(String text, Color color) => Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            border: Border.all(color: color, width: 2)),
        child: Text(text, style: Design.textButtonSmall(textColor: color)),
      );
}
