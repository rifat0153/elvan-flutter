import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';

class TopPickCardOld extends HookConsumerWidget {
  const TopPickCardOld({super.key, required this.foodItem});

  final FoodItem foodItem;

  static final double imageOffset = -48.w;
  static final double imageRadius = 64.w;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseCard(
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.sm,
                child: Stack(
                  children: [
                    Positioned(
                      top: imageOffset,
                      left: imageOffset,
                      child: CircleAvatar(
                        radius: imageRadius,
                        backgroundImage: CachedNetworkImageProvider(foodItem.imageUrl!),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: FavoriteButton(
                        isFavorite: false,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingSM),
                child: AppText(
                  foodItem.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingSM),
                child: AppText(
                  foodItem.description ?? '',
                  style: Theme.of(context).textTheme.subtitle2,
                  maxLines: 3,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(width: AppSize.paddingSM),
                  AppText(
                    foodItem.price.toString(),
                    color: AppColors.primaryRed,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Spacer(),
                  IconButton(
                    color: AppColors.primaryRed,
                    icon: const Icon(
                      Icons.add,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
