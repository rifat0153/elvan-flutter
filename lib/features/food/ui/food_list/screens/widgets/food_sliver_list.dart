import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/food_list/screens/widgets/food_list_card.dart';
import 'package:elvan/features/order/domain/models/food_item_customized.dart';
import 'package:flutter/material.dart';

class FoodSliverList extends StatelessWidget {
  const FoodSliverList({super.key, required this.foodItems});

  final Iterable<FoodItem> foodItems;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: foodItems.length,
      (context, index) {
        final foodItem = foodItems.elementAt(index);
        return FoodListCard(foodItem: foodItem);
      },
    ));
  }
}
