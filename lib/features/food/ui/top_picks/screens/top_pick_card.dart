import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPickCard extends HookConsumerWidget {
  const TopPickCard({super.key, required this.foodItem});

  final FoodItem foodItem;

  static final double imageOffset = -48.w;
  static final double imageRadius = 64.w;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseCard(
      padding: const EdgeInsets.all(0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: imageOffset,
            left: imageOffset,
            child: CircleAvatar(
              radius: imageRadius,
              backgroundImage: NetworkImage(foodItem.imageUrl!),
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
          Column(
            children: [
              const Expanded(
                flex: 5,
                child: AppText('Part 1'),
              ),
              Expanded(
                flex: 6,
                child: AppText(
                  foodItem.title,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
