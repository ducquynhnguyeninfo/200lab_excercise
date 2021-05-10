import 'package:flutter/material.dart';
import 'package:tf01_day03/font_family.dart';

class AppTextStyle {
  static const TextStyle heading = TextStyle(
    fontSize: 18,
  );
  static const TextStyle lable = TextStyle(fontSize: 14);

  static const TextStyle lablePoppins = TextStyle(
      fontSize: 14,
      fontFamily: FontFamily.poppins,
      fontWeight: FontWeight.bold);

  static const TextStyle lableNewsreader = TextStyle(
      fontSize: 14,
      fontFamily: FontFamily.newsreader,
      fontWeight: FontWeight.bold);
}
