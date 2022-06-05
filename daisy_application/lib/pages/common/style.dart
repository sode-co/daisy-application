import 'package:daisy_application/pages/common/colors.dart';
import 'package:flutter/material.dart';

class Style {
  // Text
  static const stringBold =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black);
  static const mediumStringBold = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: Color.fromARGB(255, 101, 101, 101));
  static const h6Bold =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black);
  static const whiteStringBold =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white);
  static const h2blueStringBold = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 37,
      color: Color(MyColors.blue_gradient_01));
  static const h2StringBold = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 37,
  );
  static const blueStringBold = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Color(MyColors.blue_gradient_01));
}
