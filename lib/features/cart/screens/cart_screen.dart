import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryNotifierProvider);

    return Scaffold(
      body: Column(
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
            error: (error) => ElevatedButton(
              onPressed: () {
                ref.invalidate(categoryNotifierProvider);
              },
              child: Text('Error occured $error'),
            ),
          ),
        ],
      ),
    );
  }
}
