import 'package:flutter/material.dart';
import 'dart:math';

class TweenAnimationPage extends StatefulWidget {
  const TweenAnimationPage({Key? key}) : super(key: key);

  @override
  _TweenAnimationPageState createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        duration: Duration(seconds: 1),
        tween: Tween<double>(begin: 0, end: 2 * (pi)),
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.rotate(
            angle: value,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}
