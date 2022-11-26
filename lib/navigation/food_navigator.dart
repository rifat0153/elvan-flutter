import 'package:flutter/material.dart';

import 'package:elvan/features/food/views/food_detail.dart';
import 'package:elvan/features/food/views/food_list.dart';
import 'package:elvan/navigation/root_navigator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_navigator.g.dart';

// making a PR

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> foodNavigatorKey(FoodNavigatorKeyRef ref) => GlobalKey<NavigatorState>();

class FoodNavigatorWrapper extends StatelessWidget {
  const FoodNavigatorWrapper({super.key});

  void _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(routeFoodStart);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => _onTap(context),
        child: const Text('Navigate to FoodList'),
      ),
    );
  }
}

class FoodNavigator extends ConsumerStatefulWidget {
  const FoodNavigator({super.key, required this.foodPageRoute});

  final String foodPageRoute;

  @override
  ConsumerState<FoodNavigator> createState() => _FoodNavigatorState();
}

class _FoodNavigatorState extends ConsumerState<FoodNavigator> {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final navigatorKey = ref.read(foodNavigatorKeyProvider);

    return Scaffold(
      appBar: _buildFlowAppBar(),
      body: Navigator(
        key: navigatorKey,
        initialRoute: routeFoodListPage,
        onGenerateRoute: onGenerateFoodRoute,
      ),
    );
  }

  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: _exitSetup,
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text('Food Appbar'),
    );
  }

  void _exitSetup() {
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
      page = const FoooDetailScreen();
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
