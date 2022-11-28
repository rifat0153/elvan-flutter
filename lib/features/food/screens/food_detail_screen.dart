import 'package:elvan/features/food/providers/food_detail/selected_food_item_provider.dart';
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
    final selectedFood = ref.watch(selectedFoodItemProvider);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('food id: ${selectedFood?.id}'),
            Hero(
              tag: selectedFood?.id ?? '',
              child: Image.network(
                selectedFood?.imageUrl ?? '',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Text('Food Detail Screen'),
            Text('selectedFoodId = $selectedFood'),
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
