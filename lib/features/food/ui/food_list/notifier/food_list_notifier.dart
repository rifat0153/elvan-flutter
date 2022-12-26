import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/extensions/string/string_compare_without_case_and_space_ext.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/domain/use_case/food_use_case.dart';

part 'food_list_notifier.g.dart';

@riverpod
FutureOr<Map<String, List<FoodItem>>> foodListFilteredMap(FoodListFilteredMapRef ref) {
  final foodListAsync = ref.watch(foodListNotifierProvider);
  final categoriesAsync = ref.watch(categoryNotifierProvider);
  final selectedCategoriesNotifier = ref.watch(categoryNotifierProvider.notifier);

  final selectedCategories = selectedCategoriesNotifier.selectedCategories ?? [];

  logError('selectedCategories titles: ${selectedCategories.map((e) => e.title).toList()}');

  final foodList = foodListAsync.valueOrNull ?? [];

  final filteredFoodList = foodList
      .where(
        (foodItem) => selectedCategories.isEmpty
            ? true
            : selectedCategories.any(
                (category) => foodItem.category.compareWithoutCaseAndSpace(
                  category.title,
                ),
              ),
      )
      .toList();

  final Map<String, List<FoodItem>> foodCategoryMap = {};
  for (final foodItem in filteredFoodList) {
    if (foodCategoryMap.containsKey(foodItem.category)) {
      foodCategoryMap[foodItem.category]!.add(foodItem);
    } else {
      foodCategoryMap[foodItem.category!] = [foodItem];
    }
  }

  return foodCategoryMap;
}

@Riverpod(keepAlive: true)
class FoodListNotifier extends _$FoodListNotifier {
  @override
  FutureOr<List<FoodItem>> build() async {
    final usecase = ref.read(foodUseCaseProvider);

    return usecase.getFoodList();
  }
}
