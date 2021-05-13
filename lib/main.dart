import 'package:flutter/material.dart';
import 'package:hw1_layout/day1/bai1.dart';
import 'package:hw1_layout/day1/bai3.dart';

import 'day1/bai2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '200Lab',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: '200Lab'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => Bai1()));
                },
                child: Text("Color palette 1")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => Bai2()));
                },
                child: Text("Color palette 2")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => Bai3()));
                },
                child: Text("Color palette 3")),
          ],
        ),
      ),
    );
  }
}
