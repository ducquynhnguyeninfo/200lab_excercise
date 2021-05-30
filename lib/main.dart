import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ft01_flutter_tinder_app/demo_keys%20/swap_widgets.dart';
import 'package:ft01_flutter_tinder_app/home/home_page.dart';
import 'package:ft01_flutter_tinder_app/root/root_page.dart';
import 'package:ft01_flutter_tinder_app/values/app_color.dart';
import 'package:ft01_flutter_tinder_app/values/app_text_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColor.backgroundColor,
          fontFamily: AppFontFamily.sfProText,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColor.black,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: AppColor.orange),
            unselectedIconTheme: IconThemeData(color: AppColor.lightGreyW200),
            selectedLabelStyle: TextStyle(color: AppColor.orange),
            unselectedLabelStyle: TextStyle(color: AppColor.lightGreyW200),
          ),
          scaffoldBackgroundColor: AppColor.backgroundColor),
      home: SwapPage(),
    );
  }
}
