import 'dart:developer';

import 'package:elvan/core/router/go_router.dart';
import 'package:elvan/features/tabs/ui/screens/navigation_rail_screen.dart';
import 'package:elvan/features/tabs/ui/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return SafeArea(
          child: width > 500
              ? NavigationRailScreen(
                  child: child,
                )
              : TabScreen(
                  useStack: true,
                  child: child,
                ),
        );
      },
    );
  }
}
