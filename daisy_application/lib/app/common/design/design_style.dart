import 'package:flutter/material.dart';

abstract class Design {
  static const MaterialColor colorPrimary = MaterialColor(
    0xFF0146ab,
    <int, Color>{
      100: Color(0xFF80a3d5),
      50: Color(0xFF6790cd),
      200: Color(0xFF4d7ec4),
      300: Color(0xFF346bbc),
      400: Color(0xFF1a59b3),
      500: Color(0xFF0146ab),
      600: Color(0xFF013f9a),
      700: Color(0xFF013889),
      800: Color(0xFF013178),
      900: Color(0xFF012a67),
    },
  );

  static const MaterialColor colorSecondary = MaterialColor(
    0xFF0f4c81,
    <int, Color>{
      50: Color(0xFF80cce7),
      100: Color(0xFF66c2e2),
      200: Color(0xFF4db8dd),
      300: Color(0xFF33add9),
      400: Color(0xFF1aa3d4),
      500: Color(0xFF0099cf),
      600: Color(0xFF008aba),
      700: Color(0xFF007aa6),
      800: Color(0xFF006b91),
      900: Color(0xFF005c7c),
    },
  );

  static const MaterialColor colorNeutral = MaterialColor(
    0xFF213345,
    <int, Color>{
      100: Color(0xFFF3F5F7),
      200: Color(0xFFE9EEF2),
      300: Color(0xFFDCE3EA),
      400: Color(0xFFC2CCD6),
      500: Color(0xFF213345),
      600: Color(0xFF8294A6),
      700: Color(0xFF62788D),
      800: Color(0xFF3B5268),
      900: Color(0xFF213345),
    },
  );

  static const MaterialColor accentRed = MaterialColor(
    0xFFEC3713,
    <int, Color>{
      50: Color(0xFFFFF1F0),
      100: Color(0xFFFFF1F0),
      200: Color(0xFFFEE0DC),
      300: Color(0xFFFAAA9E),
      400: Color(0xFFF56B56),
      500: Color(0xFFEC3713),
      600: Color(0xFFCD280E),
      700: Color(0xFFB31D09),
      800: Color(0xFF931206),
      900: Color(0xFF700700),
    },
  );

  static const colorWhite = Colors.white;
  static const colorBlack = Colors.black;
  static const Color headerColor = Color(0xFFF2F2F2);
  static const Color primaryTextColor = colorBlack;
  static const Color secondaryTextColor = Colors.black87;

  static final fontColorHighEmp = colorBlack;
  static final fontColorMediumEmp = colorNeutral.shade700;
  static final fontColorLowEmp = colorNeutral.shade300;
  static final fontColorWhite = colorWhite.withOpacity(0.92);

  static const double itemSpacing = 17;
  static const double headerSpacing = 30;
  static const double bodySpacing = 22;
  static const double contentSpacing = 7;

  static TextStyle textHeadline({bool bold = false}) {
    return TextStyle(
        color: fontColorHighEmp,
        fontSize: 23,
        height: 1.2,
        fontWeight: bold ? FontWeight.w500 : _toFontWeight(bold));
  }

  static TextStyle textSmallHeadline({bool bold = false}) {
    return TextStyle(
        color: fontColorHighEmp,
        fontSize: 19,
        height: 1.2,
        fontWeight: _toFontWeight(bold));
  }

  static TextStyle textTitle({Color? textColor, bool bold = true}) {
    return TextStyle(
        color: toTextColor(textColor: textColor),
        fontSize: 32,
        height: 1.11,
        fontWeight: _toFontWeight(bold));
  }

  static TextStyle textTitleFold({Color? textColor, bool bold = true}) {
    return TextStyle(
        color: toTextColor(textColor: textColor),
        fontSize: 30,
        fontWeight: FontWeight.w900);
  }

  static TextStyle textTitleLarge({Color? textColor, bool bold = true}) {
    return TextStyle(
        color: toTextColor(textColor: textColor),
        fontSize: 38,
        height: 1.11,
        fontWeight: _toFontWeight(bold));
  }

  static TextStyle textBodyBold({Color? textColor}) =>
      textBody(textColor: textColor, bold: true);

  static TextStyle textBody(
      {Color? textColor, bool bold = false, bool isEnable = false}) {
    return TextStyle(
        color: toTextColor(textColor: textColor, isEnabled: isEnable),
        fontSize: 16,
        height: 1.37,
        fontWeight: _toFontWeight(bold));
  }

  static TextStyle textLogo({Color? textColor}) {
    return TextStyle(
        color: toTextColor(textColor: textColor),
        fontSize: 60,
        fontFamily: 'larsseit',
        fontWeight: FontWeight.w900);
  }

  static TextStyle textBodyFold({Color? textColor, bool bold = false}) {
    return TextStyle(
        color: toTextColor(textColor: textColor),
        fontSize: 22,
        height: 1.3,
        fontWeight: FontWeight.w500);
  }

  static TextStyle textBodyLarge(
      {Color? textColor, bold = false, isEnabled = true}) {
    return TextStyle(
        color: toTextColor(textColor: textColor, isEnabled: isEnabled),
        fontSize: 18,
        height: 1.33,
        fontWeight: _toFontWeight(bold));
  }

  static TextStyle textName(
      {Color? textColor = Design.colorBlack, bold = false, isEnabled = true}) {
    return TextStyle(
        color: toTextColor(textColor: textColor, isEnabled: isEnabled),
        fontSize: 15,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w700);
  }

  static TextStyle textButton({Color? textColor, isEnabled = true}) {
    return TextStyle(
        color: toTextColor(textColor: textColor, isEnabled: isEnabled),
        fontSize: 20,
        fontWeight: FontWeight.w900);
  }

  static TextStyle textButtonSmall({Color? textColor, isEnabled = true}) {
    return TextStyle(
        color: toTextColor(textColor: textColor, isEnabled: isEnabled),
        fontSize: 14,
        fontWeight: FontWeight.w900);
  }

  static TextStyle textCaption({Color? textColor, bool bold = false}) {
    return TextStyle(
        color: toTextColor(textColor: textColor, isEnabled: true),
        fontSize: 16,
        height: 1.29,
        letterSpacing: 0.02,
        fontWeight: _toFontWeight(bold));
  }

  static Color toTextColor({Color? textColor, bool isEnabled = true}) {
    final color = textColor ?? fontColorHighEmp;
    return isEnabled ? color : color.withOpacity(0.44);
  }

  static TextStyle toTextStyle(
          {required TextStyle textStyle, bool isEnabled = true}) =>
      TextStyle(
          color: toTextColor(textColor: textStyle.color, isEnabled: isEnabled),
          fontSize: textStyle.fontSize,
          height: textStyle.height,
          letterSpacing: textStyle.letterSpacing,
          fontWeight: textStyle.fontWeight);

  static FontWeight _toFontWeight(bool isBold) {
    return isBold ? FontWeight.w600 : FontWeight.normal;
  }

  static TextStyle textTableHeader({Color? textColor, isEnabled = true}) {
    return TextStyle(
      color: toTextColor(textColor: textColor, isEnabled: isEnabled),
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
    );
  }
}
