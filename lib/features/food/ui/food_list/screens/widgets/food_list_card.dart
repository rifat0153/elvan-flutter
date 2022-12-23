import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/order/domain/models/food_item_customized.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';

class FoodListCard extends StatelessWidget {
  const FoodListCard({super.key, required this.foodItemCustomized});

  final FoodItemCustomized foodItemCustomized;

  @override
  Widget build(BuildContext context) {
    final foodItem = foodItemCustomized.foodItem;

    return BaseCard(
        child: Row(
      children: [
        Flexible(
          flex: 2,
          child: Stack(
            children: [],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              AppText(foodItem.title),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            children: const [
              FavoriteButton(isFavorite: false),
            ],
          ),
        ),
      ],
    ));
  }
}
