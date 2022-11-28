import 'package:elvan/features/food/providers/food_detail/selected_food_item_provider.dart';
import 'package:elvan/features/food/providers/food_list/food_list_provider.dart';
import 'package:elvan/navigation/provider/root_navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(foodListProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Screen'),
          ElevatedButton(
            onPressed: () => ref
                .read(
                  rootNavigatorKeyProvider.notifier,
                )
                .navigateToFoodDetail(),
            child: const Text('Navigate to Food Navigator: Detail'),
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
                      ref.read(rootNavigatorKeyProvider.notifier).navigateToFoodDetail();
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
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString()),
          )
        ],
      ),
    );
  }
}
