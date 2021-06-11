import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/values/app_color.dart';
import 'package:ft01_flutter_tinder_app/values/app_text_style.dart';

class LoadingWidget extends StatelessWidget {
  final String text;
  const LoadingWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: AppColor.orange,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white)),
              )),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  text,
                  style: AppTextStyle.body14White,
                ),
              )),
        ],
      ),
    );
  }
}
