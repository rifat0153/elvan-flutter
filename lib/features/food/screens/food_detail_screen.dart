import 'package:elvan/navigation/provider/food_navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoooDetailScreen extends HookConsumerWidget {
  const FoooDetailScreen({super.key});

  _onTap(WidgetRef ref) {
    final foodNavigatorKeyNotifier = ref.read(foodNavigatorKeyProvider.notifier);

    foodNavigatorKeyNotifier.navigateToFoodList();
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
