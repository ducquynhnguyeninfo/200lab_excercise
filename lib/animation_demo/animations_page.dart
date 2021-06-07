import 'package:flutter/material.dart';
import 'package:ft01_flutter_tinder_app/animation_demo/fade_animation.dart';
import 'package:ft01_flutter_tinder_app/animation_demo/fade_transition.dart';
import 'package:ft01_flutter_tinder_app/animation_demo/size_animation.dart';
import 'package:ft01_flutter_tinder_app/animation_demo/tween_animation.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SizeAnimationPage()));
                },
                child: Text('Size Animation')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FadeAnimationPage()));
                },
                child: Text('FadeIn FadeOut')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FadeTransitionAnimation()));
                },
                child: Text('Fade Transition')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => TweenAnimationPage()));
                },
                child: Text('Tween Animation')),
          ],
        ),
      ),
    );
  }
}
