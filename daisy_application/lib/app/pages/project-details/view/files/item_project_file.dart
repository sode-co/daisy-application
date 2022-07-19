import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:flutter/material.dart';

/// This file is used to declare all of the design type of items
/// that being displayed in the project file management tabs.
extension ProjectFileManagement on ProjectDetailsPageState {
  Widget createImageProjectFileItem(ResourceModel resource) => Container(
        child: Column(children: [
          // Image(image: resource.fileType)
        ]),
      );
}
