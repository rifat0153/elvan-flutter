import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/app/router/app_router.gr.dart';

class FooDDetailScreen extends HookConsumerWidget {
  const FooDDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Food Detail Screen'),
            ElevatedButton(
              onPressed: () {
                context.navigateTo(const FoodListRoute());
                // context.pushRoute(const FoodListRoute());
              },
              child: const Text('Navigate to Food List'),
            ),
          ],
        ),
      ),
    );
  }
}
