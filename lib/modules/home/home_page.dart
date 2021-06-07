import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ft01_flutter_tinder_app/common_widget/draggable_card.dart';
import 'package:ft01_flutter_tinder_app/models/user.dart';
import 'package:ft01_flutter_tinder_app/modules/home/users/user_profile.dart';
import 'package:ft01_flutter_tinder_app/modules/home/widgets/card_item.dart';
import 'package:ft01_flutter_tinder_app/values/app_icon.dart';
import 'package:ft01_flutter_tinder_app/values/app_text_style.dart';

class HomePage extends StatefulWidget {
  final List<User>? users;

  HomePage({Key? key, this.users}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  late List<User>? users;

  int countOf = 0;

  @override
  void initState() {
    users = widget.users;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: users == null
          ? Container()
          : Stack(
              children: users!
                  .map(
                    (e) => DraggableCard(
                      card: sizeCard(e),
                      isDraggable: countOf < users!.length,
                      onSlideOutComplete: (_) {
                        setState(() {
                          countOf++;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
    );
  }

  Widget sizeCard(User user) {
    return Hero(
      tag: 'header-hero${user.id}',
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(24)),
        child: CardItem(
          user: user,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => UserProfilePage(user: user)));
          },
        ),
      ),
    );
  }
}
