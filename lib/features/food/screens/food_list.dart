import 'package:elvan/features/food/providers/food_provider.dart';
import 'package:elvan/features/food/screens/food_detail.dart';
import 'package:elvan/navigation/provider/food_navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodListScreen extends HookConsumerWidget {
  const FoodListScreen({super.key});

  _onTap(BuildContext context, WidgetRef ref) {
    final foodNavigatorKey = ref.read(foodNavigatorKeyProvider);

    foodNavigatorKey.currentState?.pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const FoooDetailView(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemsStream = ref.watch(foodItemStreamOld);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Food List Screen'),
            ElevatedButton(
              onPressed: () => _onTap(context, ref),
              child: const Text('Navigate to Food Detail'),
            ),
            foodItemsStream.when(
                data: (data) => ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Text(data[index].title);
                      },
                    ),
                error: ((error, stackTrace) => Text(error.toString())),
                loading: () => const CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
