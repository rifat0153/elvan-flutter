import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/domain/use_case/food_use_case.dart';
import 'package:elvan/features/food/ui/food_list/notifier/selected_category_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_list_notifier.g.dart';

@Riverpod(keepAlive: true)
class FoodByCategoryNotifier extends _$FoodByCategoryNotifier {
  @override
  FutureOr<Map<String, List<FoodItem>>> build() async {
    final selectedCategory = ref.watch(selectedCategoriesNotifierProvider.notifier);
    final usecase = ref.read(foodUseCaseProvider);

    return usecase.getFoodCategoryMap(
      selectedCategories: selectedCategory.categories,
    );
  }
}

@Riverpod(keepAlive: true)
class FoodListNotifier extends _$FoodListNotifier {
  @override
  FutureOr<List<FoodItem>> build() async {
    final selectedCategory = ref.watch(selectedCategoriesNotifierProvider.notifier);
    final usecase = ref.read(foodUseCaseProvider);

    return usecase.getFoodList(
      selectedCategories: selectedCategory.categories,
    );
  }
}
