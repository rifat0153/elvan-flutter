import 'package:elvan/core/extensions/string/string_compare_without_case_and_space_ext.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/notifier/food_category_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final foodCategoryMapUseCaseProvider = Provider<FoodCategoryMapUseCase>(
  (ref) => FoodCategoryMapUseCase(),
);

class FoodCategoryMapUseCase {
  List<FoodCategoryMap> getFoodCategoryMapList({
    List<FoodItem> foodList = const [],
    List<String> selectedCategories = const [],
  }) {
    final List<FoodCategoryMap> foodCategoryMapList = [];

    if (selectedCategories.isEmpty) {
      selectedCategories = foodList.map((e) => e.category).toSet().toList();
    }

    for (int i = 0; i < selectedCategories.length; i++) {
      final foodItems = foodList
          .where(
            (foodItem) => foodItem.category.compareWithoutCaseAndSpace(
              selectedCategories[i],
            ),
          )
          .toList();

      foodCategoryMapList.add(
        FoodCategoryMap(
          category: selectedCategories[i],
          foodItems: foodItems,
        ),
      );
    }

    return foodCategoryMapList;
  }
}
