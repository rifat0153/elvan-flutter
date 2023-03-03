import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/category/ui/screens/category_chips.dart';
import 'package:elvan/features/food/ui/components/food_list_app_bar.dart';
import 'package:elvan/features/food/ui/components/food_sliver_list.dart';
import 'package:elvan/features/food/ui/notifier/food_list_notifier.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';

class FoodListScreen extends HookConsumerWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodListFilteredAsync = ref.watch(foodListFilteredMapProvider);

    return ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      appBar: const FoodListAppBar(),
      child: foodListFilteredAsync.when(
        data: (foodMapList) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: AppSize.paddingMD),
              ),

              // category chips
              const SliverToBoxAdapter(
                child: CategoryChips(),
              ),

              for (final foodMap in foodMapList) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSize.paddingMD),
                    child: AppText(
                      foodMap.category.title.toUpperCase(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                FoodSliverList(foodItems: foodMap.foodItems)
              ]
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text(error.toString()),
      ),
    );
  }
}
