import 'package:elvan/features/food/providers/category_provider.dart';
import 'package:elvan/features/food/providers/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(foodListNotifier2Provider);
    final categories = ref.watch(categoryListNotifierProvider);

    return Container(
      child: Column(
        children: [
          categories.when(
            data: (categoryList) => Column(
              children: categoryList
                  .map(
                    (e) => Text(e.title ?? 'No data'),
                  )
                  .toList(),
            ),
            loading: () => const Text('Loading'),
            error: (error, stack) => ElevatedButton(
              onPressed: () {
                ref.refresh(categoryListNotifierProvider);
              },
              child: const Text('Error'),
            ),
          ),
          const Text('CartScreen'),
          ProviderScope(
            overrides: [
              selectedIDProvider.overrideWithValue(1),
            ],
            child: Text('foodList length: ${foodList.length}'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(foodListNotifier2Provider.notifier).getFoods();
            },
            child: const Text('Get Foods'),
          ),
        ],
      ),
    );
  }
}
