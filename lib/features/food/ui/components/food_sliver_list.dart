import 'package:flutter/material.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/components/food_list_card.dart';
import 'package:elvan/shared/constants/app_size.dart';

class FoodSliverList extends StatelessWidget {
  const FoodSliverList({super.key, required this.foodItems});

  final Iterable<FoodItem> foodItems;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      key: key,
      delegate: SliverChildBuilderDelegate(
        childCount: foodItems.length,
        (context, index) {
          final foodItem = foodItems.elementAt(index);
          return Padding(
            key: ValueKey(foodItem.id),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.paddingMD,
              vertical: AppSize.paddingSM,
            ),
            child: FoodListCard(foodItem: foodItem),
          );
        },
      ),
    );
  }
}
