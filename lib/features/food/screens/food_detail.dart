import 'package:elvan/features/food/screens/food_list.dart';
import 'package:elvan/navigation/provider/food_navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoooDetailView extends HookConsumerWidget {
  const FoooDetailView({super.key});

  _onTap(WidgetRef ref) {
    final foodNavigatorKey = ref.read(foodNavigatorKeyProvider);

    // foodNavigatorKey.currentState?.pushNamed(routeFoodListPage);
    foodNavigatorKey.currentState?.pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const FoodListScreen(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Food Detail Screen'),
            ElevatedButton(
              onPressed: () => _onTap(ref),
              child: const Text('Navigate to Food List'),
            ),
          ],
        ),
      ),
    );
  }
}
