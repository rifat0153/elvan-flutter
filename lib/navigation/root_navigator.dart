import 'package:elvan/features/auth/screens/auth_screen.dart';
import 'package:elvan/features/cart/screens/cart_screen.dart';
import 'package:elvan/features/tabs/screens/tab_screen.dart';
import 'package:elvan/navigation/food_navigator.dart';
import 'package:flutter/material.dart';

import 'package:elvan/features/favorite/screens/favorite_screen.dart';

const routeHome = '/';
const routeAuth = '/auth';
const routeCart = '/cart';
const routeOrder = '/order';
const routeFavorite = '/favorite';

const routePrefixFood = '/food';
const routeFoodStart = '/food/$routeFoodListPage';
const routeFoodListPage = 'food_list';
const routeFoodDetailPage = 'food_detail';



MaterialPageRoute ongenerateRootRoute(RouteSettings settings) {
  late Widget page;

  if (settings.name == routeHome) {
    page = const TabScreen();
  } else if (settings.name == routeAuth) {
    page = const AuthScreen();
  } else if (settings.name == routeFavorite) {
    page = const FavoriteScreen();
  } else if (settings.name == routeCart) {
    page = const CartScreen();
  } else if (settings.name!.startsWith(routePrefixFood)) {
    final subRoute = settings.name!.substring(routePrefixFood.length);

    page = FoodNavigator(
      foodPageRoute: subRoute,
    );
  } else {
    throw Exception('Unknown route: ${settings.name}');
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
