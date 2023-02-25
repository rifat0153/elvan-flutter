import 'package:elvan_shared/domain_models/index.dart';
import 'package:elvan_shared/dtos/category/category/category.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/core/extensions/string/string_compare_without_case_and_space_ext.dart';
import 'package:elvan/features/food/ui/notifier/food_category_map.dart';

final foodCategoryMapUseCaseProvider = Provider<FoodCategoryMapUseCase>(
  (ref) => FoodCategoryMapUseCase(),
);

class FoodCategoryMapUseCase {
  List<FoodCategoryMap> getFoodCategoryMapList({
    List<FoodItem> foodList = const [],
    List<Category> categories = const [],
  }) {
    final List<FoodCategoryMap> foodCategoryMapList = [];

    for (int i = 0; i < categories.length; i++) {
      final foodItems = foodList
          .where(
            (foodItem) => foodItem.categoryId.compareWithoutCaseAndSpace(
              categories[i].id,
            ),
          )
          .toList();

      foodCategoryMapList.add(
        FoodCategoryMap(
          category: categories[i],
          foodItems: foodItems,
        ),
      );
    }

    return foodCategoryMapList;
  }
}
