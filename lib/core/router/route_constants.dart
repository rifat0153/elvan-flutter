import 'package:flutter/foundation.dart' show immutable;

@immutable
class RouteConstants {
  const RouteConstants._();

  static const routeHome = '/';
  static const routeAuth = '/auth';
  static const routeCart = '/cart';
  static const routeOrder = '/order';
  static const routeFavorite = '/favorite';

  static const routePrefixFood = '/food';
  static const routeFoodStart = '/food/$routeFoodListPage';
  static const routeFoodListPage = 'food_list';
  static const routeFoodDetailPage = 'food_detail';
}
