import 'package:flutter/material.dart';

const String robotoMediumFont = "RobotoMedium";
const String poppinsMediumFont = "poppinsMedium";
const String poppinsRegularFont = "poppinsRegular";
const String poppinsSemiBoldFont = "poppinsSemiBold";
const String poppinsBoldFont = "poppinsBold";

class AppTextStyle {
  static poppinsRegularText({
    String? text,
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
        color: color, fontSize: fontSize, fontFamily: poppinsRegularFont);
  }

  static poppinsMediumText({
    String? text,
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
        color: color, fontSize: fontSize, fontFamily: poppinsMediumFont);
  }

  static poppinsBoldText({
    String? text,
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
        color: color, fontSize: fontSize, fontFamily: poppinsBoldFont);
  }

  static poppinsSemiBoldText({
    String? text,
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
        color: color, fontSize: fontSize, fontFamily: poppinsSemiBoldFont);
  }

  static robotoMediumText({
    String? text,
    Color? color,
    double? fontSize,
  }) {
    return TextStyle(
        color: color, fontSize: fontSize, fontFamily: robotoMediumFont);
  }
}
