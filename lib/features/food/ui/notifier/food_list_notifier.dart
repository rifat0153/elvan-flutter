import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/features/food/domain/use_case/food_category_map_use_case.dart';
import 'package:elvan/features/food/ui/notifier/food_category_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/domain/use_case/food_use_case.dart';

part 'food_list_notifier.g.dart';

@riverpod
FutureOr<List<FoodCategoryMap>> foodListFilteredMap(FoodListFilteredMapRef ref) {
  final foodCategoryMapUseCase = ref.read(foodCategoryMapUseCaseProvider);

  final foodListAsync = ref.watch(foodListNotifierProvider);

  final categoriesAsync = ref.watch(categoryNotifierProvider);
  final selectedCategoriesNotifier = ref.watch(categoryNotifierProvider.notifier);
  final selectedCategories = selectedCategoriesNotifier.selectedCategories;

  final foodList = foodListAsync.valueOrNull ?? [];

  logError('Selected categories length: ${selectedCategories?.length}');

  // get good list by category
  List<FoodCategoryMap> foodCategoryMapList = [];
  foodCategoryMapList = foodCategoryMapUseCase.getFoodCategoryMapList(
    foodList: foodList,
    categories: selectedCategories ?? categoriesAsync.valueOrNull!,
  );

  return foodCategoryMapList;
}

@Riverpod(keepAlive: true)
class FoodListNotifier extends _$FoodListNotifier {
  @override
  FutureOr<List<FoodItem>> build() async {
    final usecase = ref.read(foodUseCaseProvider);

    return usecase.getFoodList();
  }
}
