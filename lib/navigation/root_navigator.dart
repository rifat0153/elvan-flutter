import 'package:elvan/navigation/food_navigator.dart';
import 'package:flutter/material.dart';

import 'package:elvan/features/cart/views/cart_screen.dart';
import 'package:elvan/features/favorite/views/favorite_screen.dart';
import 'package:elvan/features/home/views/home_screen.dart';

const routeHome = '/';
const routeCart = '/cart';
const routeFavorite = '/favorite';

const routePrefixFood = '/food';
const routeFoodStart = '/food/$routeFoodListPage';
const routeFoodListPage = 'food_list';
const routeFoodDetailPage = 'food_detail';

MaterialPageRoute ongenerateRootRoute(RouteSettings settings) {
  late Widget page;

  if (settings.name == routeHome) {
    page = const HomeScreen();
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
