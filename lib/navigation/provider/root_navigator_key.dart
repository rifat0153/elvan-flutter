import 'package:elvan/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'root_navigator_key.g.dart';

@Riverpod(keepAlive: true)
class RootNavigatorKey extends _$RootNavigatorKey {
  @override
  GlobalKey<NavigatorState> build() {
    return GlobalKey<NavigatorState>();
  }

  void navigateToFoodList() {
    state.currentState?.pushNamed('${AppRoute.routePrefixFood}${AppRoute.routeFoodListPage}');
  }

  void navigateToFoodDetail() {
    state.currentState?.pushNamed('${AppRoute.routePrefixFood}${AppRoute.routeFoodDetailPage}');
  }
}
