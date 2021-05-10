import 'package:english_words/english_words.dart';

import 'package:flutter/material.dart';
import 'package:tf01_day03/text_style.dart';
import 'package:tf01_day03/utils.dart';

class WordPairPage extends StatefulWidget {
  @override
  _WordPairPageState createState() => _WordPairPageState();
}

class _WordPairPageState extends State<WordPairPage> {
  late List<WordPair> _wordpais;

  @override
  void initState() {
    _wordpais = generateWordPairs().take(10).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Each word'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: _wordpais
            .map((e) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: randomColor(),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e.asCamelCase,
                      style: AppTextStyle.heading,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
