import 'package:elvan/features/food/state/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteScreen extends HookConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(foodListFutureProvider);

    return Container(
      child: Center(
        child: Column(
          children: [
            const Text('FavoriteScreen'),
          ],
        ),
      ),
    );
  }
}
