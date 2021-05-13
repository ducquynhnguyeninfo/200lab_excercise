import 'package:flutter/material.dart';
import 'package:hw1_layout/utils/ui_resource.dart';

class Bai1 extends StatelessWidget {
  static const List<int> colors = [
    0xff313036,
    0xff1B304B,
    0xff344869,
    0xff344869,
    0xffD5D5D5,
    0xffF1F1EF,
  ];

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(UIResource.background1);
    // var imgH = image.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(UIResource.background1),
              Text(
                "color palette",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _buildItems(context, 6)),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context, int numberItem) {
    List<Widget> items = [];
    var screenWidth = MediaQuery.of(context).size.width;
    var itemWidth = screenWidth / numberItem;
    var space = itemWidth / 3;
    itemWidth = itemWidth - space;

    for (var i = 0; i < numberItem; i++) {
      items.add(Container(
        color: Color(colors[i]),
        width: itemWidth,
        height: 100,
      ));
    }

    return items;
  }
}
