import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';

class FoodListCard extends StatelessWidget {
  const FoodListCard({super.key, required this.foodItem});

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
        child: Row(
      children: [
        Flexible(
          flex: 4,
          fit: FlexFit.tight,
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
            child: Stack(
              children: [],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
