import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:daisy_application/schema/file_transfer.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// This file is used to declare all of the design type of items
/// that being displayed in the project file management tabs.
extension ProjectFileManagement on ProjectDetailsPageState {
  Widget createProjectResourceItem(ResourceModel resource) => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(Design.headerSpacing),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 2,
                      blurRadius: 8)
                ]),
                child: resource.transferStatus != TransferStatus.DONE
                    ? _createLoadingUi(resource)
                    : Image.memory(
                        resource.binary!,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(height: Design.bodyMobileSpacing),
              Text(
                resource.fileName ?? 'unknown',
                style: Design.textBodyFold(isMobile: true),
              ),
              const SizedBox(
                height: Design.contentSpacing,
              ),
              Text(
                '${resource.id} - ${resource.fileType ?? 'unknown'}',
                style: Design.textBody(),
              )
            ]),
            Positioned(
                top: 0,
                left: 0,
                child: _createTag(resource.workStatus ?? 'InProgress'))
          ],
        ),
      );

  Widget _createLoadingUi(ResourceModel resource) {
    final percent =
        ((resource.binary!.length / resource.fileSize!) * 100).toInt();
    return Container(
      color: Design.colorWhite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset('assets/anims/anim_loading.json'),
          Text(
            '$percent %',
            style: const TextStyle(
                color: Design.colorBlack,
                fontSize: 18,
                fontFamily: 'larsseit',
                fontWeight: FontWeight.w900),
          )
        ],
      ),
    );
  }

  Widget _createTag(String tagName) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Design.contentSpacing, vertical: Design.contentSpacing),
        decoration: BoxDecoration(
            color: Colors.grey.shade600,
            borderRadius: const BorderRadius.all(Radius.circular(1))),
        child: Text(
          tagName,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Design.colorWhite),
        ),
      );
}
