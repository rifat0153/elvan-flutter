import 'package:elvan/features/food/ui/components/build_step_customization.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/food/ui/components/build_steps.dart';
import 'package:elvan/features/food/ui/components/food_detail_image_with_appbar.dart';
import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';

class FooDDetailScreen extends HookConsumerWidget {
  const FooDDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodItemState = ref.watch(selectedFoodItemNotifierProvider);

    return ElvanScaffold(
        imagePath: AppAsset.homeBackgroundPng,
        child: foodItemState.when(
          data: (foodItem) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: FoodDetailImageWithAppbar(foodItem: foodItem),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.paddingMD,
                      vertical: AppSize.paddingSM,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(foodItem.title.toUpperCase()),
                        AppText(
                          foodItem.price.toString(),
                          style: Theme.of(context).textTheme.headlineSmall,
                          color: AppColors.white,
                        ),
                        AppText(
                          foodItem.description.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                // const SliverToBoxAdapter(
                //   child: BuildStepsWidget(),
                // ),
                Consumer(
                  builder: (context, ref, child) {
                    final buildStepsAsync = ref.watch(buildStepsNotifierProvider);

                    return buildStepsAsync.when(
                      data: (buildSteps) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: buildSteps.length,
                            (context, index) {
                              return BuildStepCustomization(
                                buildStep: buildSteps[index],
                              );
                            },
                          ),
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stackTrace) => const Center(child: Text('Error')),
                    );
                  },
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => const Center(child: Text('Error')),
        ));
  }
}
