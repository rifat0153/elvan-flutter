import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/constants/app_asset.dart';

class FooDDetailScreen extends HookConsumerWidget {
  const FooDDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItem = ref.watch(selectedFoodItemNotifierProvider);

    return ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppText('Food Detail Screen'),
          AppText('Food Name: ${foodItem?.title}'),
          AppText('$foodItem'),
        ],
      ),
    );
  }
}
