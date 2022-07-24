import 'dart:typed_data';

import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/image_picker/get_image_picker_result.dart';
import 'package:daisy_application/app/flow_controllers/project_details/project_details_controller.dart';
import 'package:daisy_application/app/pages/project-details/view/files/page_project_file.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:daisy_application/core_services/socket/file_upload/file_upload_socket_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daisy_application/app/common/widget/image_picker/native_image_picker.dart'
    if (dart.library.html) 'package:daisy_application/app/common/widget/image_picker/web_image_picker.dart'
    as image_picker;

extension ProjectFileManagement on ProjectDetailsPageState {
  Widget createProjectFileManagementTab() => Container(
        child: Column(children: [
          Row(children: [
            Expanded(
                child: createProjectFileNavigation(
                    items: ['In progress', 'Declined', 'Final'])),
            _createUploadButton()
          ]),
          createProjectFilePageView(items: ['In progress', 'Declined', 'Final'])
        ]),
      );

  Widget createProjectFileNavigation(
      {required List<String> items, Function(int)? onPressed}) {
    int index = 0;
    return SizedBox(
      height: 80,
      child: SingleChildScrollView(
        child: Row(
          children: items.map((e) {
            int _index = index++;
            return Padding(
              padding: const EdgeInsets.only(left: 2),
              child: _createNavigationItem(
                  title: e,
                  index: _index,
                  borderRadius:
                      _createNavItemBorderRadius(_index, items.length),
                  onPressed: (index) {
                    switchFileTab(index);
                  }),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _createNavigationItem(
          {required String title,
          required int index,
          BorderRadius? borderRadius,
          Function(int)? onPressed}) =>
      InkWell(
        onTap: () => onPressed == null ? null : onPressed(index),
        child: Builder(builder: (context) {
          return Container(
            width: 150,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
                vertical: Design.contentSpacing,
                horizontal: Design.bodySpacing),
            height: 45,
            decoration: BoxDecoration(
                color: getTabColor(index), borderRadius: borderRadius),
            child: Text(
              title,
              style: Design.textButton(
                  textColor: getTextColor(index),
                  isMobile: !Responsive.isDesktop(context)),
            ),
          );
        }),
      );

  Future _pickImage() async {
    try {
      GetImagePickerResult pickerResult =
          await image_picker.UniversalImagePicker.getImage();

      ResourceModel newResource = ResourceModel(
          fileType: 'image',
          workspace:
              WorkspaceModel(id: screenState.project!.workspaces.first.id),
          binary: pickerResult.binary,
          fileName: pickerResult.fileName);
      await FileUploadSocketClient().uploadWorkspaceResource(newResource,
          (double progress, FAILURE_TYPE failed) {
        Debug.log('upload-file-call-back', 'uploaded progress', progress,
            'with failure type', failed);
      });
    } on PlatformException catch (e) {
      Debug.log(
          'File picker', 'An error occurs while picking image', e.message);
    }
  }

  Widget _createUploadButton() => Responsive.isDesktop(context)
      ? ButtonPrimary(
          text: 'Upload',
          backgroundColor: Colors.black38,
          onPressed: () async {
            await _pickImage();
          },
        )
      : Container();

  BorderRadius? _createNavItemBorderRadius(int index, int totalItemCount) {
    if (index == 0) {
      return const BorderRadius.only(
          topLeft: Radius.circular(4), bottomLeft: Radius.circular(4));
    }
    if (index == totalItemCount - 1) {
      return const BorderRadius.only(
          topRight: Radius.circular(4), bottomRight: Radius.circular(4));
    }

    return null;
  }

  Color getTabColor(int index) => screenState.currentFileTabIndex == index
      ? Design.colorBlack
      : Colors.black38;

  Color getTextColor(int index) => screenState.currentFileTabIndex == index
      ? Design.colorWhite
      : Colors.black;
}
