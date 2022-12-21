import 'package:elvan/core/ui_state/ui_state.dart';
import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/domain/use_case/food_use_case.dart';
import 'package:elvan/features/food/ui/food_list/notifier/selected_category_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_list_notifier.g.dart';

@Riverpod(keepAlive: true)
class FoodListNotifier extends _$FoodListNotifier {
  @override
  FutureOr<UiState<List<FoodItem>>> build() {
    final selectedCategory = ref.watch(selectedCategoriesNotifierProvider.notifier);

    final usecase = ref.read(foodUseCaseProvider);

    return usecase
        .getFoodList(
          selectedCategories: selectedCategory.categories,
        )
        .then(
          (result) => result.when(
            success: (list) => UiState.data(list),
            failure: (e) => UiState.error(e.message),
          ),
        );
  }
}
