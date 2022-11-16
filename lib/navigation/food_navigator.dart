import 'package:flutter/material.dart';

import 'package:elvan/features/food/screens/food_detail.dart';
import 'package:elvan/features/food/screens/food_list.dart';
import 'package:elvan/navigation/root_navigator.dart';

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

class FoodNavigator extends StatefulWidget {
  const FoodNavigator({super.key, required this.foodPageRoute});

  final String foodPageRoute;

  @override
  State<FoodNavigator> createState() => _FoodNavigatorState();
}

class _FoodNavigatorState extends State<FoodNavigator> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildFlowAppBar(),
      body: Navigator(
        key: _navigatorKey,
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
    Navigator.of(context).pop();
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
