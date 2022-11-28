import 'package:elvan/features/food/models/food_item/food_item.dart';
import 'package:elvan/features/food/providers/food_detail/selected_food_item_provider.dart';
import 'package:elvan/features/food/providers/food_list/food_list_provider.dart';
import 'package:elvan/navigation/provider/food_navigator_key.dart';
import 'package:elvan/navigation/provider/root_navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodListScreen extends HookConsumerWidget {
  const FoodListScreen({super.key});

  _onTap(BuildContext context, WidgetRef ref) {
    final foodNavigatorNotifier = ref.read(foodNavigatorKeyProvider.notifier);

    foodNavigatorNotifier.navigateToFoodDetail();
  }

  _navigateToFoodDetail(WidgetRef ref, FoodItem foodItem) {
    ref.read(selectedFoodItemProvider.notifier).state = foodItem;

    final foodNavigatorNotifier = ref.read(foodNavigatorKeyProvider.notifier);

    foodNavigatorNotifier.navigateToFoodDetail();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(foodListProvider);

    return Scaffold(
      body: Column(
        children: [
          const Text('Food List Screen'),
          ElevatedButton(
            onPressed: () => _onTap(context, ref),
            child: const Text('Navigate to Food Detail'),
          ),
          foodList.when(
            data: (foodList) => SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  final foodItem = foodList[index];

                  return GestureDetector(
                    key: ValueKey(foodItem.id),
                    onTap: () {
                      ref.read(selectedFoodItemProvider.notifier).state = foodItem;
                      ref.read(foodNavigatorKeyProvider.notifier).navigateToFoodDetail();
                    },
                    child: Column(
                      children: [
                        Hero(
                          tag: foodItem.id ?? '',
                          child: Image.network(
                            foodItem.imageUrl ?? '',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Text(foodList[index].title),
                      ],
                    ),
                  );
                },
              ),
            ),
            error: (error, stackTrace) => Text(
              error.toString(),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
