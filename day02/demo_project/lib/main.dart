import 'package:demo_project/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hi 200Lab",
      debugShowCheckedModeBanner: false,
      home: HomePage(
        title: "Hi 200Lab this is Home Page them vao chieu rong ",
      ),
    );
  }
}
