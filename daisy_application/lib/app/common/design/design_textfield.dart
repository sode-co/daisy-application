import 'package:daisy_application/app/common/utils/size_mode.dart';
import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final HeightMode? heightMode;
  final WidthMode? widthMode;
  final String? text;
  final String? label;
  final int maxLines;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const BasicTextField(
      {super.key,
      this.width,
      this.height,
      this.heightMode,
      this.widthMode,
      this.text,
      this.controller,
      this.validator,
      this.maxLines = 1,
      this.label,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthMode == WidthMode.MATCH_PARENT ? double.infinity : width,
      height: heightMode == HeightMode.MATCH_PARENT ? double.infinity : height,
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
            hintText: hintText),
      ),
    );
  }
}
