import 'dart:developer';

import 'package:elvan/core/router/router.dart';
import 'package:elvan/features/tabs/ui/screens/navigation_rail_screen.dart';
import 'package:elvan/features/tabs/ui/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return width > 500
            ? NavigationRailScreen(
                child: widget.child,
              )
            : TabScreen(
                child: widget.child,
              );
      },
    );
  }
}
