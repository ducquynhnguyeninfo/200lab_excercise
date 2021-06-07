import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ft01_flutter_tinder_app/common_widget/app_field.dart';
import 'package:ft01_flutter_tinder_app/common_widget/app_flat_button.dart';
import 'package:ft01_flutter_tinder_app/common_widget/loading_widget.dart';
import 'package:ft01_flutter_tinder_app/models/login.dart';
import 'package:ft01_flutter_tinder_app/modules/root/root_page.dart';
import 'package:ft01_flutter_tinder_app/services/apis/login_api.dart';
import 'package:ft01_flutter_tinder_app/services/share_services.dart';
import 'package:ft01_flutter_tinder_app/values/app_icon.dart';
import 'package:ft01_flutter_tinder_app/values/app_images.dart';
import 'package:ft01_flutter_tinder_app/values/share_key.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController userController;
  late TextEditingController pwdController;
  LoginModel? loginModel;
  LoginApi loginApi = LoginApi();
  bool busy = false;

  @override
  void initState() {
    userController = TextEditingController()..text = 'account_1';
    pwdController = TextEditingController()..text = '123456';
    super.initState();
  }

  Future<void> login() async {
    setState(() => busy = true);

    loginModel =
        await LoginApi().login(userController.text, pwdController.text);

    ShareService _share = await ShareService().getInstance();
    _share.setString(value: loginModel?.token ?? " ", key: ShareKey.token);
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_) => RootPage()), (_) => true);
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
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.multiply),
                image: AssetImage(
                  AppImage.splash_login,
                ),
                fit: BoxFit.fitHeight),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 56, horizontal: 32),
                  child: Image.asset(AppIcon.icLogo),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AppField(
                    controller: userController,
                    hinText: 'Tài khoản',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: AppField(
                    controller: pwdController,
                    obscureText: true,
                    hinText: 'Mật khẩu',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: AppFlatButton(
                    label: 'Đăng nhập',
                    onTap: () async {
                      await login();
                    },
                  ),
                ),
                Spacer()
              ]),
              Visibility(
                  visible: busy,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: LoadingWidget(
                      text: 'Đang đăng nhập',
                    ),
                  ))
            ],
          )),
    );
  }
}
