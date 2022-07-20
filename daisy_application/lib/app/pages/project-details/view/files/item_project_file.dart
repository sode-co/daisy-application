import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:flutter/material.dart';

/// This file is used to declare all of the design type of items
/// that being displayed in the project file management tabs.
extension ProjectFileManagement on ProjectDetailsPageState {
  Widget createProjectResourceItem(ResourceModel resource) => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(Design.headerSpacing),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: _createTag(resource.workStatus ?? 'InProgress')),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 0))
                ]),
                child: Expanded(
                    child: resource.binary == null
                        ? Image.asset(
                            'assets/images/ic_daisy_rectangle.jpg',
                            fit: BoxFit.contain,
                          )
                        : Image.memory(
                            resource.binary!,
                            fit: BoxFit.contain,
                          )),
              ),
              const SizedBox(height: Design.bodyMobileSpacing),
              Text(
                resource.fileName ?? 'unknown',
                style: Design.textHeadline(),
              ),
              const SizedBox(
                height: Design.contentSpacing,
              ),
              Text(
                '${resource.id} - ${resource.fileType ?? 'unknown'}',
                style: Design.textBody(),
              )
            ]),
          ],
        ),
      );

  Widget _createTag(String tagName) => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1))),
        child: Text(
          tagName,
          style: const TextStyle(fontSize: 12, color: Design.colorWhite),
        ),
      );
}
