import 'package:elvan/extensions/router/pages/go_router_tab_page.dart';
import 'package:elvan/extensions/router/pages/home_page.dart';
import 'package:elvan/extensions/router/pages/test_detail_page.dart';
import 'package:elvan/extensions/router/pages/test_list_page.dart';
import 'package:elvan/features/cart/screens/cart_screen.dart';
import 'package:elvan/features/food/screens/food_list_screen.dart';
import 'package:elvan/features/food/screens/food_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final appRouterProvider = Provider(((ref) => goRouter));

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/a',
  routes: <RouteBase>[
    /// Application shell
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        /// The first screen to display in the bottom navigation bar.
        GoRoute(
          path: '/a',
          builder: (BuildContext context, GoRouterState state) {
            return HomePage(key: state.pageKey);
          },
          routes: <RouteBase>[
            // The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return TestListPage(key: state.pageKey);
              },
            ),
          ],
        ),

        /// Displayed when the second item in the the bottom navigation bar is
        /// selected.
        GoRoute(
          path: '/b',
          builder: (BuildContext context, GoRouterState state) {
            return FoodListScreen(key: state.pageKey);
          },
          routes: <RouteBase>[
            /// Same as "/a/details", but displayed on the root Navigator by
            /// specifying [parentNavigatorKey]. This will cover both screen B
            /// and the application shell.
            GoRoute(
              path: 'details',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return FoooDetailScreen(key: state.pageKey);
              },
            ),
          ],
        ),

        /// The third screen to display in the bottom navigation bar.
        GoRoute(
          path: '/c',
          builder: (BuildContext context, GoRouterState state) {
            return CartScreen(key: state.pageKey);
          },
          routes: <RouteBase>[
            // The details screen to display stacked on the inner Navigator.
            // This will cover screen A but not the application shell.
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return TestDetailPage(key: state.pageKey);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
