import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/core/ui_state/ui_state.dart';

final selectedFoodItemNotifierProvider =
    NotifierProvider<SelectedFoodItemNotifier, UiState<FoodItem>>(() {
  return SelectedFoodItemNotifier();
});

class SelectedFoodItemNotifier extends Notifier<UiState<FoodItem>> {
  @override
  build() {
    return const UiState<FoodItem>.loading();
  }

  void setFoodItem(FoodItem foodItem) {
    state = UiState.data(foodItem);
  }

  void setFoodItemAndBuildSteps(FoodItem foodItem) {
    logWarning('setFoodItem and update build steps: ${foodItem.id}');

    ref.read(buildStepsNotifierProvider.notifier).setBuildStepsFromFoodItem(
          foodItem,
        );

    state = UiState.data(foodItem);
  }
}
