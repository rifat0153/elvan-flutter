import 'dart:developer';

import 'package:elvan/core/router/router.dart';
import 'package:elvan/features/tabs/ui/screens/navigation_rail_screen.dart';
import 'package:elvan/features/tabs/ui/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLayout extends HookConsumerWidget {
  const AppLayout({super.key, required this.child});

  final Widget child;

  Future<bool> onWillPop(BuildContext context, WidgetRef ref) {
    // final String location = GoRouterState.of(context).location;
    // context.go('/');

    final rootNavKey = ref.read(rootNavigatorKeyProvider);
    final tabNavKey = ref.read(tabShellNavigatorKeyProvider);
    tabNavKey.currentState?.pop();
    rootNavKey.currentState?.pop();
    rootNavKey.currentState?.pop();

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return WillPopScope(
          onWillPop: () => onWillPop(context, ref),
          child: width > 500
              ? NavigationRailScreen(
                  child: child,
                )
              : TabScreen(
                  child: child,
                ),
        );
      },
    );
  }
}
