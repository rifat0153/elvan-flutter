import 'package:elvan/features/food/screens/food_detail_screen.dart';
import 'package:elvan/features/food/screens/food_list_screen.dart';
import 'package:elvan/navigation/provider/root_navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_navigator_key.g.dart';

// @Riverpod(keepAlive: true)
// GlobalKey<NavigatorState> foodNavigatorKey(
//   FoodNavigatorKeyRef ref,
// ) =>
//     GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
class FoodNavigatorKey extends _$FoodNavigatorKey {
  @override
  GlobalKey<NavigatorState> build() {
    return GlobalKey<NavigatorState>();
  }

  void goBack() {
    final result = state.currentState?.canPop();

    if (result == true) {
      state.currentState?.pop();
    } else {
      final rootNavigator = ref.read(rootNavigatorKeyProvider);

      rootNavigator.currentState?.pop();
    }
  }

  void navigateToFoodList() {
    state.currentState?.push(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const FoodListScreen(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  void navigateToFoodDetail() {
    state.currentState?.push(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const FoooDetailScreen(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }
}
