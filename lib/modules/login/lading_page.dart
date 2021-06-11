import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ft01_flutter_tinder_app/common_widget/loading_widget.dart';
import 'package:ft01_flutter_tinder_app/models/user.dart';
import 'package:ft01_flutter_tinder_app/modules/login/login_page.dart';
import 'package:ft01_flutter_tinder_app/modules/root/root_page.dart';
import 'package:ft01_flutter_tinder_app/services/apis/user_api.dart';
import 'package:ft01_flutter_tinder_app/services/share_services.dart';
import 'package:ft01_flutter_tinder_app/values/app_images.dart';
import 'package:ft01_flutter_tinder_app/values/share_key.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLogined = false;

  @override
  void initState() {
    super.initState();
    fetchLogin();
  }

  fetchLogin() async {
    ShareService shareService = await ShareService().getInstance();
    isLogined = shareService.getString(ShareKey.token).isNotEmpty;
    if (isLogined) {
      List<User> users = await UserApi().getUsers();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (_) => RootPage(
                    user: users,
                  )),
          (_) => false);
    } else {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginPage()), (_) => false);
    }
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
