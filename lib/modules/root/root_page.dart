import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/models/user.dart';
import 'package:ft01_flutter_tinder_app/modules/home/home_page.dart';
import 'package:ft01_flutter_tinder_app/modules/message/message_page.dart';
import 'package:ft01_flutter_tinder_app/modules/notification/notification_page.dart';
import 'package:ft01_flutter_tinder_app/modules/profile/profile_page.dart';
import 'package:ft01_flutter_tinder_app/values/app_color.dart';
import 'package:ft01_flutter_tinder_app/values/app_icon.dart';

class RootPage extends StatefulWidget {
  final List<User>? user;

  RootPage({Key? key, this.user}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late List<Widget> pages;
  late int currentIndex = 0;

  @override
  void initState() {
    pages = [
      HomePage(users: widget.user),
      MessagePage(),
      NotificationPage(),
      ProfilePage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: pages[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        fixedColor: AppColor.orange,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: ImageIcon(AssetImage(AppIcon.icHome)),
          ),
          BottomNavigationBarItem(
            label: 'Message',
            icon: ImageIcon(AssetImage(AppIcon.icMessage)),
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            icon: ImageIcon(AssetImage(AppIcon.icNotification)),
          ),
          BottomNavigationBarItem(
              label: 'Profiles', icon: ImageIcon(AssetImage(AppIcon.icPofile))),
        ],
      ),
    );
  }
}
