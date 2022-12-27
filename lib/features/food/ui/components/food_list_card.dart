import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/shared/components/buttons/add_icon_button.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';

class FoodListCard extends StatelessWidget {
  const FoodListCard({
    super.key,
    required this.foodItem,
  });

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    final imageTopOffset = -35.w;
    final imageLeftOffset = -35.w;
    final imageRadius = 60.w;

    return BaseCard(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: [
          // Food Image
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: SizedBox(
              width: 100.w,
              height: 100.w,
              child: Stack(
                children: [
                  Positioned(
                    top: imageTopOffset,
                    left: imageLeftOffset,
                    child: CircleAvatar(
                      radius: imageRadius,
                      backgroundImage: CachedNetworkImageProvider(foodItem.imageUrl!),
                    ),
                  ),
                ],
              ),
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
                AddIconButton(
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
    );
  }
}
