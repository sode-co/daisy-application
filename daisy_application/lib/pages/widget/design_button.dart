import 'dart:typed_data';

import 'package:daisy_application/pages/common/size_mode.dart';
import 'package:daisy_application/pages/widget/design.dart';
import 'package:flutter/material.dart';

class _BaseDesignedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final WidthMode? widthMode;
  final HeightMode? heightMode;
  final VoidCallback? onPressed;

  const _BaseDesignedButton(
      {super.key,
      this.height,
      this.width,
      required this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.widthMode,
      this.heightMode,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class ButtonPrimary extends _BaseDesignedButton {
  final Color backgroundColor;

  const ButtonPrimary(
      {super.key,
      super.height,
      super.width,
      required super.text,
      super.textColor,
      super.fontSize,
      required super.fontWeight,
      super.widthMode,
      super.heightMode,
      this.backgroundColor = Design.colorPrimary,
      super.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthMode == null
          ? width
          : (widthMode == WidthMode.WRAP_CONTENT ? null : double.infinity),
      height: heightMode == null
          ? height
          : (heightMode == HeightMode.WRAP_CONTENT ? null : double.infinity),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: backgroundColor,
          border:
              Border.all(color: Design.colorPrimary, style: BorderStyle.solid)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Design.toTextColor(textColor: textColor),
              fontWeight: fontWeight,
              fontSize: fontSize),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonIcon extends _BaseDesignedButton {
  final Color backgroundColor;
  late Image image;
  ButtonIcon.asset(String name,
      {super.key,
      super.height,
      super.width,
      this.backgroundColor = Design.colorPrimary,
      super.widthMode,
      super.onPressed,
      super.heightMode,
      required super.text,
      super.textColor,
      super.fontSize,
      super.fontWeight}) {
    image = Image.asset(
      name,
      width: 16,
    );
  }

  ButtonIcon.network(String url,
      {super.key,
      super.height,
      super.width,
      this.backgroundColor = Design.colorPrimary,
      super.widthMode,
      super.onPressed,
      super.heightMode,
      required super.text,
      required super.textColor,
      required super.fontSize,
      required super.fontWeight}) {
    image = Image.network(
      url,
      width: 16,
    );
  }

  ButtonIcon.memory(Uint8List bytes,
      {super.key,
      super.height,
      super.width,
      required String url,
      this.backgroundColor = Design.colorPrimary,
      super.widthMode,
      super.onPressed,
      super.heightMode,
      required super.text,
      required super.textColor,
      required super.fontSize,
      required super.fontWeight}) {
    image = Image.memory(
      bytes,
      width: 16,
    );
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widthMode == null
            ? width
            : (widthMode == WidthMode.WRAP_CONTENT ? null : double.infinity),
        height: heightMode == null
            ? height
            : (heightMode == HeightMode.WRAP_CONTENT ? null : double.infinity),
        child: TextButton(
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                color: Design.colorPrimary,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  image,
                  const SizedBox(width: 5.0),
                  Text(text, style: Design.textCaption(bold: true)),
                ],
              ),
            ),
          ),
        ),
      );
}

class ButtonInfo extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;
  final Color textColor;
  final WidthMode? widthMode;
  final HeightMode? heightMode;
  final double? width;
  final double? height;

  const ButtonInfo(
      {super.key,
      required this.text,
      this.onPressed,
      this.fontWeight = FontWeight.bold,
      this.textColor = Colors.black,
      this.widthMode,
      this.width,
      this.height,
      this.heightMode});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widthMode == null
            ? width
            : (widthMode == WidthMode.WRAP_CONTENT ? null : double.infinity),
        height: heightMode == null
            ? height
            : (heightMode == HeightMode.WRAP_CONTENT ? null : double.infinity),
        child: TextButton(
          onPressed: onPressed,
          child: Text(text,
              style: TextStyle(fontWeight: fontWeight, color: textColor)),
        ),
      );
}
