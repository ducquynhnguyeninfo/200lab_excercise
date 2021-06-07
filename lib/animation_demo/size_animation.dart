import 'package:flutter/material.dart';

class SizeAnimationPage extends StatefulWidget {
  const SizeAnimationPage({Key? key}) : super(key: key);

  @override
  _SizeAnimationPageState createState() => _SizeAnimationPageState();
}

class _SizeAnimationPageState extends State<SizeAnimationPage>
    with TickerProviderStateMixin {
  double height = 100;
  double width = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Animation'),
      ),
      body: Center(
        child: AnimatedSize(
          vsync: this,
          duration: Duration(seconds: 3),
          curve: Curves.fastLinearToSlowEaseIn,
          alignment: Alignment.center,
          child: Container(
              height: height,
              width: width,
              color: Colors.green,
              child: Text('AnimatedContainer')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (height > 100) {
                height = 100;
                width = 100;
              } else {
                height = 300;
                width = 300;
              }
            });
          },
          child: Icon(
            Icons.opacity,
            color: Colors.white,
          )),
    );
  }
}
