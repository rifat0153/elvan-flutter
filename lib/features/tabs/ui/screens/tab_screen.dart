import 'dart:developer';

import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:elvan/shared/components/background/tab_screen_background.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
    required this.child,
    this.useStack = false,
  });

  final Widget child;
  final bool useStack;

  @override
  State<TabScreen> createState() => _TabScreenState();

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;

    log('sub location: $location');

    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/favorite')) {
      return 1;
    }
    if (location.startsWith('/profile')) {
      return 2;
    }
    return 0;
  }
}

class _TabScreenState extends State<TabScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        // backgroundColor: const Color(AppColors.primaryColor),
        // surfaceTintColor: Colors.black,
        selectedIndex: TabScreen._calculateSelectedIndex(context),
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
      // body: widget.child,
      body: TabScreenBackground(
        imagePath: AppAsset.homeBackgroundPng,
        child: widget.useStack
            ? IndexedStack(
                index: TabScreen._calculateSelectedIndex(context),
                children: const [
                  HomeScreen(),
                  FavoriteScreen(),
                  ProfileScreen(),
                ],
              )
            : widget.child,
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/favorite');
        break;
      case 2:
        GoRouter.of(context).go('/profile');
        break;
    }
  }
}
