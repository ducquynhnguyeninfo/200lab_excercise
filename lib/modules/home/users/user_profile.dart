import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/common_widget/horizontal_listview.dart';
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

  var friends = [
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-phuong-anh-9x-10-scaled.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-phuong-anh-9x-5-scaled.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-hinh-gai-xinh-2-835x1113.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-nguyen-cao-ky-duyen-1-835x835.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-nguyen-cao-ky-duyen-19-835x1043.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-nguyen-cao-ky-duyen-18-835x1044.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-hinh-gai-xinh-3-835x1113.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20181019-gai-xinh-6-scaled.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-hinh-gai-xinh-4-835x1113.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210312-ngo-thi-my-duyen-5-scaled.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210314-vivi-an-10-835x1043.jpg',
    'https://hinhgaixinh.com/wp-content/uploads/2021/03/20210312-hinh-gai-xinh-10-scaled.jpg'
  ];

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dismissible(
      key: UniqueKey(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(size),
              _buildInfo(),
              Divider(color: AppColor.lightGrey),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        _buildAbout(),
                        SizedBox(height: 12),
                        _buildFriends(),
                        SizedBox(height: 12),
                        _buildBaseProfile(),
                        SizedBox(height: 12),
                        _buildInteresting(),
                        SizedBox(height: 12),
                        _buildLookingFor(),
                        SizedBox(height: 80)
                      ],
                    ),
                  ),
                  _buildBottomGradientButtonBar()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAbout() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 12),
          Text(
            user.about!,
            textAlign: TextAlign.start,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: AppColor.lightGreyW200),
          ),
          SizedBox(height: 12),
          Text('Show more',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColor.orange)),
        ],
      ),
    );
  }

  Widget _buildBaseProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Basic Profile",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        SizedBox(height: 12),
        buildInfoPairItem(context, 'Height', '${user.height!.toString()} cm'),
        buildInfoPairItem(context, 'Weight', '${user.weight!.toString()} kg'),
        buildInfoPairItem(
            context, 'Relationship Status', '${user.relationshipStatus!.name}'),
        buildInfoPairItem(context, 'Ethnicity', '${user.gender!.toString()}'),
      ],
    );
  }

  Widget _buildFriends() {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Friends",
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 12),
          Container(
            alignment: Alignment.center,
            child: HorizontalListView(
              items: friends,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.green,
                    foregroundImage: Image.network(friends[index]).image,
                    backgroundImage: AssetImage(AppImage.candy1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Hero(
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
                          user.fullName ?? "",
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
                          calculateAge(user.dob),
                          style: AppTextStyle.titleCardWhite,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            user.address ?? "",
                            style: TextStyle(color: Colors.white),
                          ),
                          // Text(
                          //   'Seattle, USA',
                          //   style: TextStyle(color: Colors.white),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightGreyW200.withAlpha(150),
              ),
              child: InkWell(
                child: Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInteresting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Interesting",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        SizedBox(height: 12),
        Container(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 6,
            children: [
              buildRoundedBorderButton('Music', () => null),
              buildRoundedBorderButton('Fishing', () => null),
              buildRoundedBorderButton('Swimming', () => null),
              buildRoundedBorderButton('Book', () => null),
              buildRoundedBorderButton('Dancing', () => null),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildLookingFor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Looking For",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        SizedBox(height: 12),
        Container(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 6,
            children: user.lookingForTopics!
                .map((e) => buildRoundedBorderButton(e.name!, () => null))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _buildBottomGradientButtonBar() {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            AppColor.backgroundColor,
            AppColor.backgroundColor.withAlpha(125),
            Colors.transparent
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.red.shade400,
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.red,
                      Colors.red.shade400,
                      Colors.red.shade400,
                      Colors.deepOrange
                    ]),
                boxShadow: [
                  BoxShadow(color: Colors.black12),
                  BoxShadow(color: Colors.black26),
                  BoxShadow(color: Colors.grey),
                ]),
            child: Image.asset(
              'assets/icons/ic_fire.png',
              // scale: 1,
            ),
          )
        ],
      ),
    );
  }

  String calculateAge(String? dob) {
    return "21";
  }

  Widget buildRoundedBorderButton(String text, Function()? onTap) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          backgroundColor: AppColor.backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: AppColor.lightGrey))),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(fontSize: 12, color: Colors.white),
      ),
    );
  }
}

Widget buildInfoPairItem(BuildContext context, String? label, String value) {
  return Container(
    padding: EdgeInsets.all(4),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              '$label:',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white),
            )),
        Expanded(
            flex: 2,
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColor.lightGrey),
            ))
      ],
    ),
  );
}
