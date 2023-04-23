import 'package:auto_route/auto_route.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar_svg.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/providers/android_update_provider.dart';
import 'package:elvan/shared/providers/statusbar_color_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upgrader/upgrader.dart';

class BottomTabScreen extends HookConsumerWidget {
  const BottomTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    // ref.read(statusBarColorProvider(AppColors.primaryRed));
      ref.watch(androidUpdateProvider);
    return UpgradeAlert(
      child: AutoTabsScaffold(
        builder: (context, child, animation) {
          return SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  child: ScreenBackground(
                    imagePath: AppAsset.homeBackgroundPng,
                    child: child,
                  ),
                ),
                const Positioned(child: ElvanAppBarSvg())
              ],
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
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.home,
              ),
              const NavigationDestination(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              const NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
