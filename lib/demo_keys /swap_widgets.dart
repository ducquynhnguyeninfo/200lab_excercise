import 'dart:math';

import 'package:flutter/material.dart';

class SwapPage extends StatefulWidget {
  @override
  _SwapPageState createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
  List<Widget> rows = [ColorItem(), ColorItem()];

  swapTiles() {
    setState(() {
      rows.insert(1, rows.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: rows,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: Icon(Icons.change_circle),
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  final Color myColor = uniqueColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: Padding(padding: const EdgeInsets.all(80)),
    );
  }
}

Color uniqueColor() {
  Random random = Random();

  return Color.fromRGBO(
      random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0);
}
