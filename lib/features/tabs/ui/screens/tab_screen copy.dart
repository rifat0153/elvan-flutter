import 'dart:developer';

import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabScreenCopy extends StatefulWidget {
  const TabScreenCopy({
    super.key,
    required this.child,
    this.useStack = false,
  });

  final Widget child;
  final bool useStack;

  @override
  State<TabScreenCopy> createState() => _TabScreenCopyState();

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

class _TabScreenCopyState extends State<TabScreenCopy> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        // backgroundColor: const Color(AppColors.primaryColor),
        // surfaceTintColor: Colors.black,
        selectedIndex: TabScreenCopy._calculateSelectedIndex(context),
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
      body: ScreenBackground(
        imagePath: AppAsset.homeBackgroundPng,
        child: widget.useStack
            ? IndexedStack(
                index: TabScreenCopy._calculateSelectedIndex(context),
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
