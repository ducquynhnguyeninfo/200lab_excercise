import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? title;

  //null safety

  HomePage({Key? key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.star_outline),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.star_outline),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.star_outline),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.star_outline),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.star_outline),
                  ),
                  // Container(
                  //   color: Colors.red,
                  //   child: IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(Icons.star_outline),
                  //   ),
                  // ),
                  // Container(
                  //     color: Colors.green,
                  //     child: IconButton(
                  //         onPressed: () {}, icon: Icon(Icons.star_outline))),
                  // IconButton(onPressed: () {}, icon: Icon(Icons.star_outline)),
                  // IconButton(onPressed: () {}, icon: Icon(Icons.star_outline)),
                  // IconButton(onPressed: () {}, icon: Icon(Icons.star_outline)),
                ],
              ),
            ),
            Text(widget.title!),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                "$_counter",
                style: TextStyle(fontSize: 32),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
