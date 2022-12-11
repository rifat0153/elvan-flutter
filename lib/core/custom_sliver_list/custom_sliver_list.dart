import 'package:flutter/material.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList({super.key, required this.nestedWidgetList});

  final List<List<Widget>> nestedWidgetList;

  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  List<SliverList> innerLists = [];

  @override
  void initState() {
    super.initState();

    final numLists = widget.nestedWidgetList.length;

    for (int i = 0; i < numLists; i++) {
      final numberOfItemsPerList = widget.nestedWidgetList[i].length;
      final innerList = <Widget>[];

      for (int j = 0; j < numberOfItemsPerList; j++) {
        innerList.add(widget.nestedWidgetList[i][j]);
      }
      innerLists.add(
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => innerList[index],
            childCount: numberOfItemsPerList,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: innerLists);
  }
}
