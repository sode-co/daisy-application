import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/utils/size_mode.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class AddArtworkDialog extends Dialog {
  final BuildContext context;
  late TextEditingController descriptionController1;
  late TextEditingController descriptionController2;
  final Function()? onConfirmClicked;

  AddArtworkDialog(this.context, this.onConfirmClicked, {Key? key})
      : super(key: key) {
    descriptionController1 = TextEditingController();
    descriptionController2 = TextEditingController();
  }

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget? get child => Container(
        padding: const EdgeInsets.all(Design.headerSpacing),
        width: context.deviceInfo.screenSize.width * 0.6,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _createHeader(),
                _createHeaderDivider(),
                const SizedBox(height: Design.headerSpacing),
                createTitleBox(),
                const SizedBox(height: Design.bodySpacing),
                createImageBox(),
                const SizedBox(height: Design.bodySpacing),
                createFooter(),
                const SizedBox(height: Design.headerSpacing),
                createSubmitButton()
              ]),
        ),
      );

  Widget _createDivider() => Container(
        margin: const EdgeInsets.only(top: Design.contentSpacing),
        decoration: BoxDecoration(
            color: Design.fontColorLowEmp,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        height: 1,
      );

  Widget _createHeaderDivider() => Column(
        children: [
          _createDivider(),
          const SizedBox(height: Design.headerSpacing),
          Container(
            decoration: BoxDecoration(
                color: Design.fontColorLowEmp,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            height: 10,
          ),
        ],
      );

  Widget _createHeader() => Row(children: [
        Expanded(
          child: Text('Thông tin artwork',
              style:
                  Design.textTitle(textColor: Design.colorBlack, bold: false)),
        ),
        IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop()),
      ]);

  Widget createFooter() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Application powered by Slimair',
            style: Design.textCaption(),
          ),
        ],
      );

  Widget createSubmitButton() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ButtonPrimary(
            fontSize: Design.textButtonSmall().fontSize,
            text: 'Add artwork',
            onPressed:
                onConfirmClicked == null ? null : () => onConfirmClicked!(),
            textColor: Colors.white,
          )
        ],
      );

  Widget createTitleBox() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tiêu đề',
            style: Design.textCaption(),
          ),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          BasicTextField(
            widthMode: WidthMode.MATCH_PARENT,
            controller: descriptionController1,
            maxLines: 1,
            hintText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          ),
        ],
      );

  Widget createImageBox() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Link to artwork',
            style: Design.textCaption(),
          ),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          BasicTextField(
            widthMode: WidthMode.MATCH_PARENT,
            controller: descriptionController2,
            maxLines: 1,
            hintText:
                'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
          ),
        ],
      );
}
