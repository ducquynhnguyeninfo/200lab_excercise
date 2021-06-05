import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/values/app_color.dart';

class AppFlatButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final String label;
  const AppFlatButton(
      {Key? key,
      required this.onTap,
      required this.label,
      this.backgroundColor = AppColor.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
    );
  }
}
