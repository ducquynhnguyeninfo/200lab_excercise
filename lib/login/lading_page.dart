import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ft01_flutter_tinder_app/common_widget/app_field.dart';
import 'package:ft01_flutter_tinder_app/common_widget/app_flat_button.dart';
import 'package:ft01_flutter_tinder_app/common_widget/loading_widget.dart';
import 'package:ft01_flutter_tinder_app/models/login.dart';
import 'package:ft01_flutter_tinder_app/services/api.dart';
import 'package:ft01_flutter_tinder_app/services/apis/login_api.dart';
import 'package:ft01_flutter_tinder_app/services/share_services.dart';
import 'package:ft01_flutter_tinder_app/values/app_icon.dart';
import 'package:ft01_flutter_tinder_app/values/app_images.dart';
import 'package:ft01_flutter_tinder_app/values/share_key.dart';

class LadingPage extends StatefulWidget {
  const LadingPage({Key? key}) : super(key: key);

  @override
  _LadingPageState createState() => _LadingPageState();
}

class _LadingPageState extends State<LadingPage> {
  bool busy = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> login() async {
    setState(() => busy = true);

    setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));

    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.multiply),
            image: AssetImage(
              AppImage.splash_login,
            ),
            fit: BoxFit.fitHeight),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: LoadingWidget(
          text: 'Đang tải dữ liệu',
        ),
      ),
    ));
  }
}
