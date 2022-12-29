import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/core/ui_state/ui_state.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';

part 'selected_food_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedFoodItemNotifier extends _$SelectedFoodItemNotifier {
  @override
  UiState<FoodItem> build() {
    return const UiState.loading();
  }

  void setFoodItem(FoodItem foodItem) {
    logWarning('setFoodItem and update build steps: ${foodItem.id}');

    ref.read(buildStepsNotifierProvider.notifier).setBuildStepsFromFoodItem(
          foodItem,
        );

    state = UiState.data(foodItem);
  }
}
