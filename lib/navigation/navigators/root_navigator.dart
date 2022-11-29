import 'package:elvan/features/auth/screens/auth_screen.dart';
import 'package:elvan/features/cart/screens/cart_screen.dart';
import 'package:elvan/features/tabs/screens/tab_screen.dart';
import 'package:elvan/navigation/app_routes.dart';
import 'package:elvan/navigation/navigators/food_navigator.dart';
import 'package:flutter/material.dart';

import 'package:elvan/features/favorite/screens/favorite_screen.dart';

MaterialPageRoute ongenerateRootRoute(RouteSettings settings) {
  late Widget page;

  if (settings.name == AppRoute.routeHome) {
    page = TabScreen();
  } else if (settings.name == AppRoute.routeAuth) {
    page = const AuthScreen();
  } else if (settings.name == AppRoute.routeFavorite) {
    page = const FavoriteScreen();
  } else if (settings.name == AppRoute.routeCart) {
    page = const CartScreen();
  } else if (settings.name!.startsWith(AppRoute.routePrefixFood)) {
    final subRoute = settings.name!.substring(AppRoute.routePrefixFood.length);

    debugPrint('subRoute: $subRoute');

    page = FoodNavigator(
      foodPageRoute: subRoute,
    );
  } else {
    throw Exception('Root Navigator -> Unknown route: ${settings.name}');
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
