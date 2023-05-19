import 'package:collection/collection.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:elvan_shared/dtos/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
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

    state = AsyncValue.data(buildSteps ?? []);
  }

  List<BuildStep>? getBuildStepFromCategory(String categoryId) {
    final category = ref.read(categoryNotifierProvider).value?.firstWhereOrNull(
      (e) {
        return e.id?.toLowerCase() == categoryId.toLowerCase();
      },
    );

    return category?.buildSteps;
  }
}
