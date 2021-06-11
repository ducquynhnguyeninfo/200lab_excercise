import 'package:flutter/material.dart';

typedef ItemBuilder(BuildContext context, int index);

class HorizontalListView<T> extends StatefulWidget {
  final Iterable<T>? items;
  final ItemBuilder? itemBuilder;

  HorizontalListView({this.items, this.itemBuilder});

  @override
  _HorizontalListViewState createState() => _HorizontalListViewState<T>();
}

class _HorizontalListViewState<T> extends State<HorizontalListView<T>> {
  _HorizontalListViewState();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        maxHeight: 80,
        maxWidth: size.width,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        primary: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.items!.length,
        itemExtent: 70.0,
        itemBuilder: (BuildContext context, int index) {
          return widget.itemBuilder!(context, index);
        },
        // padding: EdgeInsets.all(5),
      ),
    );
  }
}
