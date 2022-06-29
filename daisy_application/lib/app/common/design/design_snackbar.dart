import 'package:flutter/material.dart';

import 'design_style.dart';

extension Toast on BuildContext {
  void toastError(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: Design.textBody(textColor: Design.colorWhite),
        ),
        backgroundColor: Design.accentRed,
      ),
    );
  }

  void toastSuccess(String text) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: Design.textBody(textColor: Design.colorWhite),
        ),
        backgroundColor: Design.colorPrimary,
      ),
    );
  }
}
