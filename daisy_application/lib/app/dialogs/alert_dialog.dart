import 'dart:math';

import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/math_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../common/design/design.dart';

class DialogAlert extends Dialog {
  final BuildContext context;
  final String message;
  final String title;
  final String affirmativeText;
  final String negativeText;
  final VoidCallback? onNegativeClicked;
  final VoidCallback? onAffirmativeClicked;
  late Color titleColor;
  late Color buttonColor;
  late Color buttonTextColor;
  final PopupMode mode;

  DialogAlert.info(this.context,
      {super.key,
      this.mode = PopupMode.Info,
      required this.message,
      this.title = 'Infomation popup',
      this.onNegativeClicked,
      this.onAffirmativeClicked,
      this.affirmativeText = 'Ok',
      this.negativeText = 'Cancel'}) {
    buttonColor = Design.colorNeutral.shade400;
    buttonTextColor = Design.colorNeutral.shade800;
    titleColor = buttonColor;
  }

  DialogAlert.error(this.context,
      {super.key,
      this.mode = PopupMode.Error,
      required this.message,
      this.title = 'Error',
      this.onNegativeClicked,
      this.onAffirmativeClicked,
      this.affirmativeText = 'Ok',
      this.negativeText = 'Cancel'}) {
    buttonColor = Design.accentRed.shade300;
    buttonTextColor = Design.accentRed.shade700;
    titleColor = buttonColor;
  }

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget? get child => Container(
        width: limit(
            MediaQuery.of(context).size.width *
                (Responsive.isDesktop(context) ? 0.5 : 0.8),
            max: 600),
        padding: const EdgeInsets.only(
            top: Design.headerSpacing * 1.3,
            bottom: Design.headerSpacing * 1.6,
            left: Design.headerSpacing,
            right: Design.headerSpacing),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createTitle(),
              const SizedBox(height: Design.headerSpacing),
              _createMessage(),
              const SizedBox(
                height: Design.headerSpacing * 2,
              ),
              _createButtons(),
            ]),
      );

  Widget _createTitle() => Row(
        children: [
          Icon(
            Icons.info,
            color: titleColor,
            size: 30,
          ),
          const SizedBox(width: Design.itemSpacing),
          Text(
            title,
            style: Design.textTitleFold(),
          )
        ],
      );

  Widget _createMessage() => Text(
        message,
        style: Design.textBodyFold(bold: true, textColor: Design.colorNeutral),
      );

  Widget _createButtons() => LayoutBuilder(builder: (context, constranit) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonInfo(
              text: negativeText,
              onPressed: onNegativeClicked,
              textColor: buttonTextColor,
            ),
            const SizedBox(width: Design.headerSpacing * 1.2),
            ButtonPrimary(
              text: affirmativeText,
              onPressed: onAffirmativeClicked,
              textColor: buttonTextColor,
              backgroundColor: buttonColor,
            )
          ],
        );
      });
}
