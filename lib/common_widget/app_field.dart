import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/values/app_color.dart';
import 'package:ft01_flutter_tinder_app/values/app_text_style.dart';

class AppField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hinText;

  const AppField(
      {Key? key,
      required this.controller,
      this.obscureText = false,
      this.hinText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.body14White,
      controller: controller,
      cursorColor: AppColor.orange,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle:
            TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
        fillColor: AppColor.black,
        filled: true,
        focusColor: Colors.white,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
    );
  }
}
