import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:flutter/material.dart';

class FoodListColumn extends StatelessWidget {
  const FoodListColumn({super.key, required this.foodItems});

  final Iterable<FoodItem> foodItems;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: foodItems.length,
      (context, index) {
        
      },
    ));
  }
}
