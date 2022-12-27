import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/core/ui_state/ui_state.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';

part 'selected_food_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedFoodItemNotifier extends _$SelectedFoodItemNotifier {
  @override
  UiState<FoodItem> build() {
    return UiState.loading();
  }

  void setFoodItem(FoodItem foodItem) {
    logWarning('setFoodItem: ${foodItem.id}');
    state = UiState.data(foodItem);
  }
}
