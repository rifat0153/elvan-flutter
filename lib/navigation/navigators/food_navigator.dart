import 'package:elvan/navigation/app_routes.dart';
import 'package:elvan/navigation/provider/food_navigator_key.dart';
import 'package:flutter/material.dart';

import 'package:elvan/features/food/screens/food_detail_screen.dart';
import 'package:elvan/features/food/screens/food_list_screen.dart';
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
        initialRoute: foodPageRoute,
        onGenerateRoute: _onGenerateFoodRoute,
      ),
    );
  }

  PreferredSizeWidget _buildFoodAppBar(WidgetRef ref) {
    return AppBar(
      leading: IconButton(
        onPressed: () => _goBackInFoodNavigator(ref),
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text('Food Appbar'),
    );
  }

  void _goBackInFoodNavigator(WidgetRef ref) {
    ref.read(foodNavigatorKeyProvider.notifier).goBack();
  }
}

Route _onGenerateFoodRoute(RouteSettings settings) {
  late Widget page;

  switch (settings.name) {
    case AppRoute.routeFoodListPage:
      page = const FoodListScreen();
      break;
    case AppRoute.routeFoodDetailPage:
      page = const FoooDetailScreen();
      break;
    default:
      throw Exception('Food Navigator -> Unknown route: ${settings.name}');
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
