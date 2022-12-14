import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/top_picks/screens/top_pick_card.dart';
import 'package:flutter/material.dart';

class TopPicksGrid extends StatelessWidget {
  const TopPicksGrid({super.key, required this.foodItems});

  final Iterable<FoodItem> foodItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final foodItem = foodItems.elementAt(index);

          return TopPickCard(foodItem: foodItem);
        });
  }
}
