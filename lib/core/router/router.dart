import 'package:elvan/features/cart/screens/cart_screen.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/food/screens/food_list_screen.dart';
import 'package:elvan/features/food/screens/food_detail_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:elvan/features/tabs/ui/screens/tab_screen.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _tabShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final appRouterProvider = Provider(((ref) => goRouter));

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
  );
}

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/tab',
  redirect: (context, state) {
    if (state.location == '/') {
      return '/tab';
    }
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/tab',
      pageBuilder: (context, state) => const MaterialPage<void>(child: Text('Tab')),
      redirect: (context, state) {
        if (state.location == '/tab') {
          return '/tab/home';
        }
        return null;
      },
      routes: [
        /// Application shell
        ShellRoute(
          navigatorKey: _tabShellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return TabScreen(child: child);
          },
          routes: <RouteBase>[
            /// The first screen to display in the bottom navigation bar.
            GoRoute(
              path: 'home',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage(key: state.pageKey, child: const HomeScreen());
              },
            ),

            /// Displayed when the second item in the the bottom navigation bar is
            /// selected.
            GoRoute(
              path: 'favorite',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage(key: state.pageKey, child: const FavoriteScreen());
              },
            ),

            /// The third screen to display in the bottom navigation bar.
            GoRoute(
              path: 'profile',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return NoTransitionPage(key: state.pageKey, child: const ProfileScreen());
              },
            ),
          ],
        ),
      ],
    ),

    // Food Routes
    GoRoute(
      path: '/food',
      pageBuilder: (context, state) => const MaterialPage<void>(child: Text('Food Navigator')),
      redirect: (context, state) {
        if (state.location == '/food') {
          return '/food/list';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: 'list',
          builder: (BuildContext context, GoRouterState state) {
            return FoodListScreen(key: state.pageKey);
          },
        ),
        GoRoute(
          path: ':id',
          builder: (BuildContext context, GoRouterState state) {
            return FooDDetailScreen(key: state.pageKey);
          },
        ),
      ],
    ),

    // Cart Routes
    GoRoute(
      path: '/cart',
      builder: (BuildContext context, GoRouterState state) {
        return CartScreen(key: state.pageKey);
      },
    ),
  ],
);
