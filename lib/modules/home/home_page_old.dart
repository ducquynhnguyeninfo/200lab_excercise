// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:ft01_flutter_tinder_app/home/widgets/card_item.dart';
// import 'package:ft01_flutter_tinder_app/users/user_profile.dart';
// import 'package:ft01_flutter_tinder_app/values/app_color.dart';
// import 'package:ft01_flutter_tinder_app/values/app_icon.dart';
// import 'package:ft01_flutter_tinder_app/values/app_text_style.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<int> cards = List.generate(10, (index) => index);

//   PageController pageController = PageController();

//   double currentPage = 0;
//   int currentIndex = 0;

//   @override
//   void initState() {
//     pageController.addListener(() {
//       print('page: ${pageController.page}');
//       setState(() {
//         currentPage = pageController.page ?? 0;
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Find Match',
//           style: AppTextStyle.title,
//         ),
//         leading: InkWell(
//           onTap: () {},
//           child: ImageIcon(
//             AssetImage(AppIcon.icNearby),
//           ),
//         ),
//         actions: [
//           InkWell(
//             onTap: () {},
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ImageIcon(
//                 AssetImage(AppIcon.icFilter),
//                 size: 42,
//               ),
//             ),
//           ),
//         ],
//         elevation: 0,
//       ),
//       body: Center(
//         child: PageView.builder(
//           controller: pageController,
//           onPageChanged: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           itemCount: cards.length,
//           itemBuilder: (context, index) {
//             print('index: $index');
//             if (currentPage > index) {
//               double scaleFactor = max(1 - (currentPage - index) * 0.4, 0.6);
//               double angleFactor = min((currentPage - index) * 20, 20);
//               return Transform(
//                 transform: Matrix4.identity()
//                   ..setEntry(3, 2, 0.001)
//                   ..scale(scaleFactor)
//                   ..rotateZ(-(pi / 180) * angleFactor),
//                 child: sizeCard(),
//               );
//             } else {
//               double scaleFactor = max(1 - (index - currentPage) * 0.4, 0.6);
//               double angleFactor = min((index - currentPage) * 20, 20);
//               return Transform(
//                 transform: Matrix4.identity()
//                   ..setEntry(3, 2, 0.001)
//                   ..scale(scaleFactor)
//                   ..rotateZ((pi / 90) * angleFactor),
//                 child: sizeCard(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget sizeCard() {
//     return Hero(
//       tag: 'header-hero',
//       child: Material(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.all(Radius.circular(24)),
//         child: CardItem(
//           onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (_) => UserProfilePage()));
//           },
//         ),
//       ),
//     );
//   }
// }
