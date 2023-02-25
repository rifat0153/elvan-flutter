import 'package:elvan_shared/domain_models/index.dart';
import 'package:elvan_shared/dtos/category/category/category.dart';
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
