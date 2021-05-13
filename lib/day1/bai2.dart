import 'package:flutter/material.dart';
import 'package:hw1_layout/utils/ui_resource.dart';

class Bai2 extends StatelessWidget {
  static const List<int> colors = [
    0xffACA9BE,
    0xffE1D1DE,
    0xffF1F1EF,
    0xffF6F0F4,
    0xff3C483A,
    0xff354035,
    0xffA9AAC0,
    0xffBAB2C7,
  ];

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(UIResource.background1);
    // var imgH = image.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "color palette",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _buildItems(context, colors.sublist(0, 4))),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _buildItems(context, colors.sublist(4, 8))),
                    ],
                  ),
                ),
                Image.asset(UIResource.background2),
              ],
            ),
          )),
    );
  }

  List<Widget> _buildItems(BuildContext context, List<int> colors) {
    List<Widget> items = [];
    var screenWidth = MediaQuery.of(context).size.width;
    var itemWidth = screenWidth / colors.length;
    var space = itemWidth / 4;
    itemWidth = itemWidth - space;

    for (var i = 0; i < colors.length; i++) {
      items.add(Container(
        decoration: BoxDecoration(
          color: Color(colors[i]),
          shape: BoxShape.circle,
        ),
        width: itemWidth,
        height: 80,
      ));
    }

    return items;
  }
}
