import 'package:flutter/material.dart';
import 'package:tf01_day03/text_style.dart';
import 'package:tf01_day03/ui_assets_page.dart';

class AssetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assets Page'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This is heading style',
                style: AppTextStyle.heading,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This is lable style',
                style: AppTextStyle.lable,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This is custom font style',
                style: AppTextStyle.lablePoppins,
              ),
            ),
            Image.asset(UIData.background)
          ],
        ),
      ),
    );
  }
}
