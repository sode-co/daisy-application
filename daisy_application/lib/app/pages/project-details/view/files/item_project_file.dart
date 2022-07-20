import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:flutter/material.dart';

/// This file is used to declare all of the design type of items
/// that being displayed in the project file management tabs.
extension ProjectFileManagement on ProjectDetailsPageState {
  Widget createProjectResourceItem(ResourceModel resource) => Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: _createTag(resource.workStatus ?? 'InProgress')),
          Column(children: [
            resource.binary == null
                ? Image.asset('assets/images/ic_daisy_rectangle.jpg')
                : Image.memory(resource.binary!),
            const SizedBox(height: Design.bodyMobileSpacing),
            Text(
              resource.fileName ?? 'unknown',
              style: Design.textBodyBold(),
            ),
            const SizedBox(
              height: Design.contentSpacing,
            ),
            Text(
              '${resource.id} - ${resource.fileName ?? 'unknown'}',
              style: Design.textBody(),
            )
          ]),
        ],
      );

  Widget _createTag(String tagName) => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1))),
        child: Text(
          tagName,
          style: const TextStyle(fontSize: 12),
        ),
      );
}
