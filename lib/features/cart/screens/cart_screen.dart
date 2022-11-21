import 'package:elvan/features/food/data/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final foodList = ref.watch(foodListProvider(1));
    final foodList = ref.watch(foodListNotifier2Provider);

    return Container(
      child: Column(
        children: [
          const Text('CartScreen'),
          Text('foodList length: ${foodList.length}'),
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
