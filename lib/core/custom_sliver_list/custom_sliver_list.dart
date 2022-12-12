import 'package:flutter/foundation.dart';
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

    calculateLists();
  }

  Future calculateLists() async {
    // innerLists = createSlivers(widget.nestedWidgetList);
    innerLists = await compute(createSlivers, widget.nestedWidgetList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return innerLists.isEmpty
        ? const Text('Loading...')
        : CustomScrollView(
            primary: false,
            slivers: innerLists,
          );
  }
}

List<SliverList> createSlivers(List<List<Widget>> widgetList) {
  List<SliverList> lists = [];

  final numLists = widgetList.length;

  for (int i = 0; i < numLists; i++) {
    final numberOfItemsPerList = widgetList[i].length;
    final innerList = <Widget>[];

    for (int j = 0; j < numberOfItemsPerList; j++) {
      innerList.add(widgetList[i][j]);
    }
    lists.add(
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => innerList[index],
          childCount: numberOfItemsPerList,
        ),
      ),
    );
  }

  return lists;
}
