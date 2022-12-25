import 'package:auto_route/auto_route.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:flutter/material.dart';

import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:elvan/shared/constants/app_asset.dart';

class BottomTabScreen extends StatelessWidget {
  const BottomTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return AutoTabsScaffold(
      builder: (context, child, animation) {
        return SafeArea(
          child: ScreenBackground(
            imagePath: AppAsset.homeBackgroundPng,
            child: child,
          ),
        );
      },
      routes: const [
        HomeRoute(),
        FavoriteRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
