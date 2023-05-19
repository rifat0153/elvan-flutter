import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/features/favorite/notifer/favorite_provider.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan/app/router/app_router.gr.dart';

class FoodListCard extends HookConsumerWidget {
  const FoodListCard({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tileHeight = 100.w;
    final imageTopOffset = -35.w;
    final imageLeftOffset = -35.w;
    final imageRadius = 50.w;
    final selectedFoodItemNotifier = ref.read(selectedFoodItemNotifierProvider.notifier);

    return BaseCard(
      key: key,
      onTap: () {
        selectedFoodItemNotifier.setFoodItemAndBuildSteps(foodItem);
        if (foodItem.title == 'Salads Bar') {
          context.pushRoute(const SaladRouter());
        } else {
          context.pushRoute(const FoodRouter(children: [
            FoodListRoute(),
            FoodDetailRoute(),
          ]));
        }
      },
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: tileHeight + 6,
        child: Row(
          children: [
            // Food Image
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Positioned(
                        top: imageTopOffset,
                        left: imageLeftOffset,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(imageRadius),
                          child: Hero(
                            tag: foodItem.id!,
                            child: CachedNetworkImage(
                              imageUrl: foodItem.imageUrl ?? '',
                              fit: BoxFit.cover,
                              width: imageRadius * 2,
                              height: imageRadius * 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Title, Ingredients, Price
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    foodItem.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: AppSize.paddingXS,
                  ),
                  AppText(
                    foodItem.ingredients.join(', '),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: AppSize.paddingXS,
                  ),
                  AppText(
                    foodItem.price.toString(),
                    color: AppColors.primaryRed,
                  ),
                ],
              ),
            ),
            // Favorite Button and Add to Cart Button
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Consumer(
                    builder: (BuildContext context, WidgetRef ref, Widget? child) {
                      final _ = ref.watch(favoriteProvider);
                      final favProviderNotifier = ref.read(favoriteProvider.notifier);
                      return FavoriteButton(
                        isFavorite: favProviderNotifier.isFavorite(foodItem),
                        foodItem: foodItem,
                        onPressed: () {
                          favProviderNotifier.toggle(foodItem);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
