import 'package:flutter/material.dart';

class SizeAnimationPage extends StatefulWidget {
  const SizeAnimationPage({Key? key}) : super(key: key);

  @override
  _SizeAnimationPageState createState() => _SizeAnimationPageState();
}

class _SizeAnimationPageState extends State<SizeAnimationPage>
    with TickerProviderStateMixin {
  double height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Animation'),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
                height: height,
                width: 100,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text('AnimatedContainer'),
              ),
            ),
            VerticalDivider(
              color: Colors.red,
            ),
            Expanded(
              flex: 1,
              child: AnimatedSize(
                duration: Duration(milliseconds: 500),
                reverseDuration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
                child: Container(
                  width: 100,
                  height: height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text('Size Container'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (height > 100) {
                height = 100;
              } else {
                height = 300;
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
