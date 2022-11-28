import 'package:elvan/features/food/providers/category/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListNotifierProvider);

    return Container(
      child: Column(
        children: [
          const Text('CartScreen'),
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
              child: Text('Error occured $error'),
            ),
          ),
        ],
      ),
    );
  }
}
