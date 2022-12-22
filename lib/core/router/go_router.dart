import 'package:elvan/core/router/go_router_notifier.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/auth/ui/screens/auth_screen.dart';
import 'package:elvan/features/cart/ui/screens/cart_screen.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/food/ui/food_list/screens/food_list_screen.dart';
import 'package:elvan/features/food/ui/food_detail/screens/food_detail_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
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
    final notifier = ref.watch(goRouterNotifierProvider);

    return GoRouter(
      navigatorKey: ref.read(rootNavigatorKeyProvider),
      debugLogDiagnostics: true,
      initialLocation: '/auth',
      // initialLocation: '/tab',
      refreshListenable: notifier,
      redirect: (context, state) {
        final authState = ref.read(authStateProvider);
        final loggedIn = authState.valueOrNull != null;

        // final authNotifier = ref.read(authNotifierProvider);
        // final loggedIn = authNotifier.maybeWhen(authenticated: (elvanUser) => true, orElse: () => false);

        // if the user is not logged in, they need to login
        final loggingIn = state.subloc == '/auth';

        // bundle the location the user is coming from into a query parameter
        final fromp = state.subloc == '/home' ? '' : '?from=${state.subloc}';
        if (!loggedIn) return loggingIn ? null : '/auth$fromp';

        // if the user is logged in, send them where they were going before (or
        // home if they weren't going anywhere)
        if (loggingIn) return state.queryParams['from'] ?? '/home';

        // no need to redirect at all
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          redirect: (context, state) => '/auth',
        ),
        ShellRoute(
          navigatorKey: ref.read(tabShellNavigatorKeyProvider),
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return AppLayout(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) {
                return HomeScreen(key: state.pageKey);
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: ref.read(rootNavigatorKeyProvider),
                  path: 'food',
                  name: 'food_list',
                  builder: (BuildContext context, GoRouterState state) {
                    return FoodListScreen(key: state.pageKey);
                  },
                ),
                GoRoute(
                  parentNavigatorKey: ref.read(rootNavigatorKeyProvider),
                  path: 'food/:id',
                  name: 'food_detail',
                  builder: (BuildContext context, GoRouterState state) {
                    return FooDDetailScreen(key: state.pageKey);
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/favorite',
              builder: (BuildContext context, GoRouterState state) {
                return FavoriteScreen(key: state.pageKey);
              },
            ),
            GoRoute(
              path: '/profile',
              builder: (BuildContext context, GoRouterState state) {
                return ProfileScreen(key: state.pageKey);
              },
            ),
          ],
        ),

        // Auth Routes
        GoRoute(
          path: '/auth',
          builder: (BuildContext context, GoRouterState state) {
            return AuthScreen(key: state.pageKey);
          },
        ),

        // Food Routes

        // Cart Routes
        GoRoute(
          path: '/cart',
          builder: (BuildContext context, GoRouterState state) {
            return CartScreen(key: state.pageKey);
          },
        ),
      ],
    );
  }),
);
