import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/home/widgets/card_item.dart';
import 'package:ft01_flutter_tinder_app/values/app_icon.dart';
import 'package:ft01_flutter_tinder_app/values/app_text_style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Match',
          style: AppTextStyle.title,
        ),
        leading: InkWell(
          onTap: () {},
          child: ImageIcon(
            AssetImage(AppIcon.icNearby),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(
                AssetImage(AppIcon.icFilter),
                size: 42,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Center(
        child: SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.75,
          child: CardItem(
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  GlobalKey globalKey = GlobalKey();
}
