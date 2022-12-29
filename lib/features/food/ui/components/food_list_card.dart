import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/shared/components/buttons/elvan_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';

import '../../../../app/router/app_router.gr.dart';

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
        selectedFoodItemNotifier.setFoodItem(foodItem);

        context.pushRoute(const FooDDetailRoute());
      },
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: tileHeight,
        child: Row(
          children: [
            // Food Image
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  logError('Constrant Height and Width: ${constraints.maxHeight} - ${constraints.maxWidth}');

                  return Stack(
                    children: [
                      Positioned(
                        top: imageTopOffset,
                        left: imageLeftOffset,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(imageRadius),
                          child: CachedNetworkImage(
                            imageUrl: foodItem.imageUrl ?? '',
                            fit: BoxFit.cover,
                            width: imageRadius * 2,
                            height: imageRadius * 2,
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
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: AppSize.paddingXS,
                  ),
                  AppText(foodItem.ingredients.join(', ')),
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
                  ElvanIconButton(
                    icon: Icons.add,
                    color: AppColors.primaryRed,
                    // TODO: Add to cart
                    onPressed: () {},
                  ),
                  FavoriteButton(
                    isFavorite: foodItem.isFavorite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
