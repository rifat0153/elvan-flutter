import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabScreen extends HookConsumerWidget {
  const TabScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        // backgroundColor: const Color(AppColors.primaryColor),
        // surfaceTintColor: Colors.black,
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int idx) => _onItemTapped(idx, context),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            label: 'Settings',
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person),
          ),
        ],
      ),
      body: child,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;

    log('sub location: $location');

    if (location.startsWith('/tab/home')) {
      return 0;
    }
    if (location.startsWith('/tab/favorite')) {
      return 1;
    }
    if (location.startsWith('/tab/profile')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/tab/home');
        break;
      case 1:
        GoRouter.of(context).go('/tab/favorite');
        break;
      case 2:
        GoRouter.of(context).go('/tab/profile');
        break;
    }
  }
}
