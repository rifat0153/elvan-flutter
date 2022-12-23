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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i11;

import '../../features/auth/ui/screens/auth_screen.dart' as _i1;
import '../../features/favorite/screens/favorite_screen.dart' as _i6;
import '../../features/food/ui/food_detail/screens/food_detail_screen.dart'
    as _i9;
import '../../features/food/ui/food_list/screens/food_list_screen.dart' as _i8;
import '../../features/profile/ui/screens/profile_screen.dart' as _i7;
import '../../features/tabs/ui/screens/home_screen.dart' as _i5;
import '../../features/tabs/ui/screens/tab_screen.dart' as _i2;
import 'not_found_screen.dart' as _i4;
import 'route_guards.dart' as _i12;

class AppRouter extends _i10.RootStackRouter {
  AppRouter({
    _i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i12.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    BottomTabRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.BottomTabScreen(),
      );
    },
    FoodRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    NotFoundRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NotFoundScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    FavoriteRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FavoriteScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileScreen(),
      );
    },
    FoodListRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.FoodListScreen(),
      );
    },
    FooDDetailRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.FooDDetailScreen(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/tabs',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          AuthRouter.name,
          path: '/auth',
        ),
        _i10.RouteConfig(
          BottomTabRoute.name,
          path: '/tabs',
          guards: [authGuard],
          children: [
            _i10.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: BottomTabRoute.name,
            ),
            _i10.RouteConfig(
              FavoriteRoute.name,
              path: 'favorites',
              parent: BottomTabRoute.name,
            ),
            _i10.RouteConfig(
              ProfileRoute.name,
              path: 'profile',
              parent: BottomTabRoute.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          FoodRouter.name,
          path: '/food',
          children: [
            _i10.RouteConfig(
              FoodListRoute.name,
              path: '',
              parent: FoodRouter.name,
            ),
            _i10.RouteConfig(
              FooDDetailRoute.name,
              path: 'details',
              parent: FoodRouter.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          NotFoundRoute.name,
          path: '*',
        ),
      ];
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRouter extends _i10.PageRouteInfo<void> {
  const AuthRouter()
      : super(
          AuthRouter.name,
          path: '/auth',
        );

  static const String name = 'AuthRouter';
}

/// generated route for
/// [_i2.BottomTabScreen]
class BottomTabRoute extends _i10.PageRouteInfo<void> {
  const BottomTabRoute({List<_i10.PageRouteInfo>? children})
      : super(
          BottomTabRoute.name,
          path: '/tabs',
          initialChildren: children,
        );

  static const String name = 'BottomTabRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class FoodRouter extends _i10.PageRouteInfo<void> {
  const FoodRouter({List<_i10.PageRouteInfo>? children})
      : super(
          FoodRouter.name,
          path: '/food',
          initialChildren: children,
        );

  static const String name = 'FoodRouter';
}

/// generated route for
/// [_i4.NotFoundScreen]
class NotFoundRoute extends _i10.PageRouteInfo<void> {
  const NotFoundRoute()
      : super(
          NotFoundRoute.name,
          path: '*',
        );

  static const String name = 'NotFoundRoute';
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.FavoriteScreen]
class FavoriteRoute extends _i10.PageRouteInfo<void> {
  const FavoriteRoute()
      : super(
          FavoriteRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i8.FoodListScreen]
class FoodListRoute extends _i10.PageRouteInfo<void> {
  const FoodListRoute()
      : super(
          FoodListRoute.name,
          path: '',
        );

  static const String name = 'FoodListRoute';
}

/// generated route for
/// [_i9.FooDDetailScreen]
class FooDDetailRoute extends _i10.PageRouteInfo<void> {
  const FooDDetailRoute()
      : super(
          FooDDetailRoute.name,
          path: 'details',
        );

  static const String name = 'FooDDetailRoute';
}
