import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/cart/ui/notifier/cart_update_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:auto_route/auto_route.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/components/build_step_customization.dart';
import 'package:elvan/features/food/ui/components/food_detail_image_with_appbar.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:elvan/features/food/ui/notifier/current_build_step_price_notifier.dart';
import 'package:elvan/features/food/ui/notifier/is_build_step_valid_provider.dart';
import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/buttons/elvan_button.dart';
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
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: FoodDetailImageWithAppbar(foodItem: foodItem),
                    ),
                    _foodDescription(foodItem, context),
                    SliverToBoxAdapter(
                      child: AppText(
                        ref
                            .watch(
                              isBuildStepsValidProvider,
                            )
                            .toString(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: AppText(
                        ref
                            .watch(
                              currentBuildStepsPriceProvider,
                            )
                            .toString(),
                      ),
                    ),
                    _buildStepsCustomization(),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: AppSize.padding4XL),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _cartButton(foodItem, context),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => const Center(child: Text('Error')),
        ));
  }

  Padding _cartButton(
    FoodItem foodItem,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.paddingMD,
        vertical: AppSize.paddingMD,
      ),
      child: Consumer(
        builder: ((context, ref, child) {
          final isBuildStepsValid = ref.watch(isBuildStepsValidProvider);
          final cartUpdateNotifier = ref.watch(cartItemUpdateProvider.notifier);
          final isCartUpdating = cartUpdateNotifier.isUpdating;

          final String cartButtonText = isCartUpdating ? 'Update cart' : 'Add to cart';

          if (!isBuildStepsValid) {
            return const SizedBox();
          }

          return ElvanButton(
            color: isBuildStepsValid ? AppColors.primaryRed : AppColors.grey,
            onPressed: () {
              ref.read(cartNotifierProvider.notifier).handleAddToCart();

              context.popRoute();
            },
            child: AppText(
              cartButtonText,
              color: AppColors.white,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          );
        }),
      ),
    );
  }

  Consumer _buildStepsCustomization() {
    return Consumer(
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
    );
  }

  SliverToBoxAdapter _foodDescription(FoodItem foodItem, BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}
