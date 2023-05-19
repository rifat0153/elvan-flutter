import 'package:elvan/core/extensions/build_context/screen_size_ext.dart';
import 'package:elvan/shared/components/background/elvan_safe_remove_scaffold.dart';
import 'package:elvan/shared/providers/statusbar_color_helper.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/cart/ui/notifier/cart_update_notifier.dart';
import 'package:elvan/features/food/ui/components/build_step_customization.dart';
import 'package:elvan/features/food/ui/components/food_detail_image_with_appbar.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:elvan/features/food/ui/notifier/current_build_step_price_notifier.dart';
import 'package:elvan/features/food/ui/notifier/is_build_step_valid_provider.dart';
import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';
import 'package:elvan/shared/components/buttons/elvan_button.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FoodDetailScreen extends HookConsumerWidget {
  const FoodDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      statusBarColorProvider(AppColors.grey_70);
      return;
    }, const []);

    final foodItemState = ref.watch(selectedFoodItemNotifierProvider);

    return ElvanSafeRemoveScaffold(
        imagePath: AppAsset.homeBackgroundPng,
        child: foodItemState.when(
          data: (foodItem) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: FoodDetailImageWithAppbar(foodItem: foodItem),
                      ),
                      _foodDescription(foodItem, context),
                      _buildStepsCustomization(foodItem),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: AppSize.padding4XL),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _cartButton(foodItem, context),
                ),
                Positioned(
                    child: Container(
                  color: AppColors.primaryRed,
                  width: context.screenWidth,
                  height: MediaQuery.of(context).padding.top,
                ))
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
          final currentBuildStepsPrice = ref.watch(currentBuildStepsPriceProvider);
          final totalPrice = foodItem.price + currentBuildStepsPrice;

          final String cartText = isCartUpdating ? AppLocalizations.of(context)!.updateCart : AppLocalizations.of(context)!.addToCart;
          final String cartButtonText = '$cartText - \$ $totalPrice';

          return ElvanButton(
            color: isBuildStepsValid ? AppColors.primaryRed : AppColors.grey,
            onPressed: () {
              if (!isBuildStepsValid) {
                return;
              }
              ref.read(cartProvider.notifier).handleAddToCart();
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

  Consumer _buildStepsCustomization(FoodItem foodItem) {
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
                    isSaladBar: foodItem.categoryId == "category-2",
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
              foodItem.ingredients.join(","),
              style: Theme.of(context).textTheme.bodyLarge,
              color: Colors.grey,
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
