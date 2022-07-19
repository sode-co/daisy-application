import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/common/to_string_utils.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/common/access_utils.dart';

extension ProjectOverviewTab on ProjectDetailsPageState {
  Widget createProjectOverViewTab() {
    ProjectModel project = screenState.project!;
    return ListView(children: [
      Container(
        alignment: Alignment.topCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Brief', style: Design.textSmallLogo()),
                ),
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _createItemTitleOverview(project.name ?? ''),
                createItemOverview(
                    title: 'Customer', content: project.customer?.displayName),
                createItemOverview(
                    title: 'Designer',
                    content: project.freelancer?.displayName),
                createItemOverview(
                    title: 'Budget',
                    content:
                        project.budget == null ? null : '${project.budget}\$'),
                createItemOverview(
                    title: 'Main category', content: project.category?.name),
                createItemOverview(
                    title: 'Prefered language',
                    content: project.preferedLanguage ?? 'Vietnamese'),
                createItemOverview(
                    title: 'Timeline',
                    content: project.timeline
                        .thenReturn(project.timeline?.displayDateOnly())),
                createItemOverview(
                    title: 'Description', content: project.description),
              ],
            )),
            Expanded(child: Container())
          ],
        ),
      ),
    ]);
  }

  Widget createItemOverview({required String title, String? content}) =>
      Padding(
        padding: const EdgeInsets.only(top: Design.bodySpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _createItemTitleOverview(title),
            _createItemContentOverview(content ?? 'Unknown')
          ],
        ),
      );

  Widget _createItemTitleOverview(String text) => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(bottom: Design.itemSpacing),
        child: Text(text, style: Design.textBodyFold()),
      );

  Widget _createItemContentOverview(String text) => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(bottom: Design.itemSpacing),
        child: Text(text, style: Design.textSmallHeadline(bold: true)),
      );
}
