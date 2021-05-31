import 'package:flutter/material.dart';

class OngNoi extends StatelessWidget {
  final Widget child;

  OngNoi(this.child);

  static OngNoi? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType();
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class ChaMe extends StatelessWidget {
  final Widget child;

  static ChaMe? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType();
  }

  ChaMe(this.child);

  @override
  Widget build(BuildContext context) {
    OngNoi? ongNoi = OngNoi.of(context);
    print(ongNoi);
    return child;
  }
}

class Con1 extends StatelessWidget {
  static Con1? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Con 1',
        style: sample,
      ),
    );
  }
}

class Con2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Con1? chame = Con1.of(context);
    print(chame);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Con 2',
        style: sample,
      ),
    );
  }
}

TextStyle sample = TextStyle(color: Colors.white, fontSize: 32);

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OngNoi(ChaMe(
        Row(
          children: [Con1(), Con2()],
        ),
      )),
    );
  }
}
