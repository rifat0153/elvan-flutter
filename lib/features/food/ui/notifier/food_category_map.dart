import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class FoodCategoryMap {
  final Category category;
  final List<FoodItem> foodItems;

  bool foodExists(String foodId) {
    return foodItems.any((foodItem) => foodItem.id == foodId);
  }

  const FoodCategoryMap({
    required this.category,
    required this.foodItems,
  });
}
