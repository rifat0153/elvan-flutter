import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/features/category/ui/notifier/selected_category_notifier.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/domain/use_case/food_use_case.dart';

part 'food_list_notifier.g.dart';

@riverpod
FutureOr<Map<String, List<FoodItem>>> foodListFilteredMap(FoodListFilteredMapRef ref) {
  final foodListAsync = ref.watch(foodListNotifierProvider);
  final selectedCategories = ref.watch(selectedCategoriesNotifierProvider.notifier);

  print('foodListFilteredMap build: $selectedCategories');

  final foodList = foodListAsync.maybeWhen(orElse: () => null, data: (data) => data);

  final filteredFoodList = foodList!
      .where(
        (e) => selectedCategories.isEmpty
            ? true
            : selectedCategories.categories.contains(
                e.category?.toLowerCase().replaceAll(' ', ''),
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
class FoodByCategoryNotifier extends _$FoodByCategoryNotifier {
  @override
  FutureOr<Map<String, List<FoodItem>>> build() async {
    final selectedCategory = ref.watch(selectedCategoriesNotifierProvider.notifier);
    print('FoodByCategoryNotifier build: $selectedCategory');

    final usecase = ref.read(foodUseCaseProvider);

    return usecase.getFoodByCategories(
      selectedCategories: selectedCategory.categories,
    );
  }
}

@Riverpod(keepAlive: true)
class FoodListNotifier extends _$FoodListNotifier {
  @override
  FutureOr<List<FoodItem>> build() async {
    final usecase = ref.read(foodUseCaseProvider);

    return usecase.getFoodList();
  }
}
