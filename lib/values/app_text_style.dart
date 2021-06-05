import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/values/app_color.dart';

class AppFontFamily {
  static const String sfProText = 'SFProText';
}

class AppTextStyle {
  static const TextStyle title = TextStyle(
      fontFamily: AppFontFamily.sfProText, fontSize: 22, color: Colors.white);

  static const TextStyle body15 = TextStyle(
      fontFamily: AppFontFamily.sfProText,
      fontSize: 15,
      color: AppColor.lightGreyW200,
      fontStyle: FontStyle.normal);

  static const TextStyle titleCard = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      fontFamily: AppFontFamily.sfProText,
      color: AppColor.black);

  static const TextStyle body14White =
      TextStyle(color: Colors.white, fontSize: 14);
}
