import 'package:flutter/material.dart';

class FadeAnimationPage extends StatefulWidget {
  const FadeAnimationPage({Key? key}) : super(key: key);

  @override
  _FadeAnimationPageState createState() => _FadeAnimationPageState();
}

class _FadeAnimationPageState extends State<FadeAnimationPage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade Animation'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1000),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          child: Icon(
            Icons.opacity,
            color: Colors.white,
          )),
    );
  }
}
