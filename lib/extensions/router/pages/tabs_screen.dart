import 'package:elvan/extensions/router/pages/home_page.dart';
import 'package:elvan/extensions/router/pages/test_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterTabsScreen extends StatefulWidget {
  final int index;
  GoRouterTabsScreen({super.key,  this.index = 0}) {
    assert(index != -1);
  }

  @override
  _GoRouterTabsScreenState createState() => _GoRouterTabsScreenState();
}

class _GoRouterTabsScreenState extends State<GoRouterTabsScreen> with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(GoRouterTabsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.index;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(_title(context)),
          bottom: TabBar(
            controller: _controller,
            tabs: const [
              Tab(text: 'Homes'),
              Tab(text: 'Foods'),
            ],
            onTap: (index) => _tap(context, index),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: const [
            HomePage(),
            TestListPage(),
          ],
        ),
      );

  void _tap(BuildContext context, int index) => context.go('/family/$index');

  String _title(BuildContext context) => (context as Element).findAncestorWidgetOfExactType<MaterialApp>()!.title;
}
