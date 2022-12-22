// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i9;

import '../../features/favorite/screens/favorite_screen.dart' as _i4;
import '../../features/food/ui/food_detail/screens/food_detail_screen.dart'
    as _i7;
import '../../features/food/ui/food_list/screens/food_list_screen.dart' as _i6;
import '../../features/profile/ui/screens/profile_screen.dart' as _i5;
import '../../features/tabs/ui/screens/home_screen.dart' as _i3;
import '../../features/tabs/ui/screens/tab_screen.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    TabsRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BottomTabScreen(),
      );
    },
    FoodRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FavoriteScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
    FoodListRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FoodListScreen(),
      );
    },
    FooDDetailRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.FooDDetailScreen(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tabs',
          fullMatch: true,
        ),
        _i8.RouteConfig(
          TabsRouter.name,
          path: '/tabs',
          children: [
            _i8.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: TabsRouter.name,
            ),
            _i8.RouteConfig(
              FavoriteRoute.name,
              path: 'favorites',
              parent: TabsRouter.name,
            ),
            _i8.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: TabsRouter.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          FoodRouter.name,
          path: '/food',
          children: [
            _i8.RouteConfig(
              FoodListRoute.name,
              path: '',
              parent: FoodRouter.name,
            ),
            _i8.RouteConfig(
              FooDDetailRoute.name,
              path: 'details',
              parent: FoodRouter.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.BottomTabScreen]
class TabsRouter extends _i8.PageRouteInfo<void> {
  const TabsRouter({List<_i8.PageRouteInfo>? children})
      : super(
          TabsRouter.name,
          path: '/tabs',
          initialChildren: children,
        );

  static const String name = 'TabsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FoodRouter extends _i8.PageRouteInfo<void> {
  const FoodRouter({List<_i8.PageRouteInfo>? children})
      : super(
          FoodRouter.name,
          path: '/food',
          initialChildren: children,
        );

  static const String name = 'FoodRouter';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.FavoriteScreen]
class FavoriteRoute extends _i8.PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.FoodListScreen]
class FoodListRoute extends _i8.PageRouteInfo<void> {
  const FoodListRoute()
      : super(
          FoodListRoute.name,
          path: '',
        );

  static const String name = 'FoodListRoute';
}

/// generated route for
/// [_i7.FooDDetailScreen]
class FooDDetailRoute extends _i8.PageRouteInfo<void> {
  const FooDDetailRoute()
      : super(
          FooDDetailRoute.name,
          path: 'details',
        );

  static const String name = 'FooDDetailRoute';
}
