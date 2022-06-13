import 'package:daisy_application/pages/common/colors.dart';
import 'package:flutter/material.dart';

class Style {
  // Text
  static const stringBold = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87);
  static const mediumStringBold =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black);
  static var h6Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 21,
    color: Colors.black.withOpacity(0.8),
  );
  static const whiteStringBold =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white);
  static const h2blueStringBold = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 37,
      color: Color(BuiltinColor.blue_gradient_01));
  static const h2StringBold = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 37,
  );
  static const blueStringBold = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Color(BuiltinColor.blue_gradient_01));
}
