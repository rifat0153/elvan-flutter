import 'package:elvan/core/router/go_router_notifier.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/auth/ui/screens/auth_screen.dart';
import 'package:elvan/features/cart/ui/screens/cart_screen.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/food/ui/food_list/screens/food_list_screen.dart';
import 'package:elvan/features/food/ui/food_detail/screens/food_detail_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:elvan/features/tabs/ui/screens/tab_screen.dart';
import 'package:elvan/shared/components/layout/app_layout.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final rootNavigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'root');
});

final tabShellNavigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'tab_shell');
});

final goRouterProvider = Provider(
  ((
    ref,
  ) {
    final notifier = ref.read(goRouterNotifierProvider);

    return GoRouter(
      initialLocation: '/',
      routes: [
        // top-level route
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            // one sub-route
            GoRoute(
              path: 'food',
              builder: (context, state) => const FoodListScreen(),
            ),
            // another sub-route
            GoRoute(
              path: 'modal',
              pageBuilder: (context, state) => const MaterialPage(
                fullscreenDialog: true,
                child: FooDDetailScreen(),
              ),
            )
          ],
        ),
      ],
    );
  }),
);
