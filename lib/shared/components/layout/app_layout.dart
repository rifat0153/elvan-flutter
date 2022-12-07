import 'dart:developer';

import 'package:elvan/features/tabs/ui/screens/navigation_rail_screen.dart';
import 'package:elvan/features/tabs/ui/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLayout extends HookConsumerWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return width > 500
            ? NavigationRailScreen(
                child: child,
              )
            : TabScreen(
                child: child,
              );
      },
    );
  }
}
