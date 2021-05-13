import 'package:flutter/material.dart';
import 'package:hw1_layout/utils/ui_resource.dart';

class Bai3 extends StatelessWidget {
  static const List<int> colors = [
    0xffACA9BE,
    0xffE1D1DE,
    0xffF1F1EF,
    0xffF6F0F4,
    0xff3C483A,
    0xff354035,
    0xffA9AAC0,
    0xffBAB2C7,
    0xffABC3C7,
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var overlayY = screenHeight / 2;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: colors
                          .map((e) => Container(color: Color(e)))
                          .toList(),
                    ),
                    Expanded(child: Container(color: Colors.blue)),
                    Expanded(child: Container(color: Colors.yellow)),
                    Expanded(child: Container(color: Colors.purple)),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.red,
              )),
              SizedBox(width: 4),
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Positioned(
            top: overlayY,
              left: screenWidth / 6,
              child: Container(
            color: Colors.grey.withOpacity(0.7),
            width: screenHeight / 4,
            height: screenHeight / 4,
          ))
        ]),
      ),
    );
  }
}
