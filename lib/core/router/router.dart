import 'package:elvan/core/router/go_router_notifier.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/auth/ui/screens/auth_screen.dart';
import 'package:elvan/features/cart/screens/cart_screen.dart';
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
    final notifier = ref.read(goRouterNotifierProvider);

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
        final fromp = state.subloc == '/' ? '' : '?from=${state.subloc}';
        if (!loggedIn) return loggingIn ? null : '/auth$fromp';

        // if the user is logged in, send them where they were going before (or
        // home if they weren't going anywhere)
        if (loggingIn) return state.queryParams['from'] ?? '/';

        // no need to redirect at all
        return null;
      },
      routes: <RouteBase>[
        // initial route
        GoRoute(
          path: '/',
          redirect: (context, state) => '/tab',
        ),

        // Tab Shell
        GoRoute(
          path: '/tab',
          // builder: (context, state) => const Text('Tab'),
          pageBuilder: (context, state) => const MaterialPage<void>(child: Text('Tab')),
          redirect: (context, state) {
            debugPrint('Tab redirect: ${state.location}');

            if (state.location == '/tab') {
              return '/tab/home';
            }
            return null;
          },
          routes: [
            /// Application shell
            ShellRoute(
              navigatorKey: ref.read(tabShellNavigatorKeyProvider),
              builder: (BuildContext context, GoRouterState state, Widget child) {
                return AppLayout(child: child);
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

        // Auth Routes
        GoRoute(
          path: '/auth',
          builder: (BuildContext context, GoRouterState state) {
            return AuthScreen(key: state.pageKey);
          },
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
  }),
);
