import 'package:flutter/material.dart';

class FadeTransitionAnimation extends StatefulWidget {
  const FadeTransitionAnimation({Key? key}) : super(key: key);

  @override
  _FadeTransitionAnimationState createState() =>
      _FadeTransitionAnimationState();
}

class _FadeTransitionAnimationState extends State<FadeTransitionAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fade Transition Animation')),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: FlutterLogo(
            size: 64,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: Icon(
            Icons.opacity,
            color: Colors.white,
          )),
    );
  }
}
