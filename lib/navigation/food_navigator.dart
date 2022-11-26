import 'package:elvan/navigation/provider/food_navigator_key.dart';
import 'package:flutter/material.dart';

import 'package:elvan/features/food/screens/food_detail.dart';
import 'package:elvan/features/food/screens/food_list.dart';
import 'package:elvan/navigation/root_navigator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodNavigator extends HookConsumerWidget {
  const FoodNavigator({super.key, required this.foodPageRoute});

  final String foodPageRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = ref.read(foodNavigatorKeyProvider);

    return Scaffold(
      appBar: _buildFoodAppBar(ref),
      body: Navigator(
        key: navigatorKey,
        initialRoute: routeFoodListPage,
        onGenerateRoute: onGenerateFoodRoute,
      ),
    );
  }

  PreferredSizeWidget _buildFoodAppBar(WidgetRef ref) {
    return AppBar(
      leading: IconButton(
        onPressed: () => _exitFoodNavigator(ref),
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text('Food Appbar'),
    );
  }

  void _exitFoodNavigator(WidgetRef ref) {
    final navigatorKey = ref.read(foodNavigatorKeyProvider);

    navigatorKey.currentState?.pop();
  }
}

Route onGenerateFoodRoute(RouteSettings settings) {
  late Widget page;

  switch (settings.name) {
    case routeFoodListPage:
      page = const FoodListScreen();
      break;
    case routeFoodDetailPage:
      page = const FoooDetailView();
      break;
    default:
      throw Exception('Unknown route: ${settings.name}');
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
