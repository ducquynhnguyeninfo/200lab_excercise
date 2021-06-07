import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/models/user.dart';
import 'package:ft01_flutter_tinder_app/values/app_color.dart';
import 'package:ft01_flutter_tinder_app/values/app_images.dart';
import 'package:ft01_flutter_tinder_app/values/app_text_style.dart';

class UserProfilePage extends StatefulWidget {
  final User user;
  const UserProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late User user;
  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.cancel),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(size),
            _buildInfo(),
            _buildAbout(),
          ],
        ),
      ),
    );
  }

  Widget _buildAbout() {
    return Container();
  }

  Widget _buildHeader(Size size) {
    return Material(
      child: Hero(
        tag: 'header-hero${user.id}',
        child: Stack(
          children: [
            Container(
                height: size.height * 0.8,
                child: Image.asset(
                  AppImage.candy,
                  fit: BoxFit.fitHeight,
                )),
            Container(
              width: double.infinity,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [AppColor.backgroundColor, Colors.transparent])),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Candy Crush',
                          style: AppTextStyle.titleCardWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 3,
                            height: 3,
                            decoration: BoxDecoration(
                                color: AppColor.lightGrey,
                                shape: BoxShape.circle),
                          ),
                        ),
                        Text(
                          '21',
                          style: AppTextStyle.titleCardWhite,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            'Versatile',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Seattle, USA',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.black,
                ),
                child: InkWell(
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
