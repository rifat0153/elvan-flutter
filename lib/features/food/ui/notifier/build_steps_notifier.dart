import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/domain/use_case/build_steps_use_case.dart';

enum AddOnQuantityAction { increment, decrement, toggleIsSelected }

final buildStepsNotifierProvider = AsyncNotifierProvider<BuildStepsNotifier, List<BuildStep>>(
  BuildStepsNotifier.new,
);

class BuildStepsNotifier extends AsyncNotifier<List<BuildStep>> {
  @override
  FutureOr<List<BuildStep>> build() {
    return [];
  }

  void toggleAddOnIsSelectedState({
    required String buildStepId,
    required String addOnId,
  }) {
    final buildStepUseCase = ref.read(buildStepsUseCaseProvider);
    final buildSteps = state.value ?? [];

    final updatedBuildSteps = buildStepUseCase.toggleAddOnIsSelectedState(
      buildSteps,
      addOnId,
      buildStepId,
    );

    state = AsyncValue.data(updatedBuildSteps);
  }

  void resetAndSet(List<BuildStep> buildSteps) {
    state = AsyncValue.data(buildSteps);
  }

  void reset() {
    state = const AsyncValue.data([]);
  }

  void setBuildSteps(List<BuildStep> buildSteps) {
    state = AsyncValue.data(buildSteps);
  }

  void setBuildStepsFromFoodItem(FoodItem foodItem) {
    final buildSteps = getBuildStepFromCategory(foodItem.categoryId);

    logError('buildSteps: ${buildSteps?.length}');

    state = AsyncValue.data(buildSteps ?? []);
  }

  List<BuildStep>? getBuildStepFromCategory(String categoryId) {
    final category = ref.read(categoryNotifierProvider).value?.firstWhereOrNull(
      (e) {
        logError('Compare: ${e.title.toLowerCase()} == $categoryId');
        return e.id?.toLowerCase() == categoryId.toLowerCase();
      },
    );

    return category?.buildSteps;
  }
}
