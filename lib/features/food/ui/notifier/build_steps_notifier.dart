import 'package:collection/collection.dart';
import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';

part 'build_steps_notifier.g.dart';

enum AddOnQuantityAction { increment, decrement, toggleIsSelected }

@Riverpod(keepAlive: true)
class BuildStepsNotifier extends _$BuildStepsNotifier {
  @override
  FutureOr<List<BuildStep>> build() {
    return [];
  }

  bool get isBuildStepsValid {
    return state.maybeWhen(
      data: (buildSteps) {
        return buildSteps.every((e) => e.isAddOnsValid);
      },
      orElse: () => false,
    );
  }

  void resetAndSet(List<BuildStep> buildSteps) {
    state = AsyncValue.data(buildSteps);
  }

  void updateAddOnQuantity({
    required String buildStepId,
    required String addOnId,
    required AddOnQuantityAction action,
  }) {
    final buildSteps = state.value ?? [];

    final updatedBuildSteps = buildSteps
        .map(
          (e) => e.copyWith(
            addOns: e.addOns.map((addOn) {
              if (addOn.id == addOnId) {
                switch (action) {
                  case AddOnQuantityAction.increment:
                    return addOn.incrementQuantity();
                  case AddOnQuantityAction.decrement:
                    return addOn.decrementQuantity();
                  case AddOnQuantityAction.toggleIsSelected:
                    return addOn.toggleIsSelected();
                }
              }

              return addOn;
            }).toList(),
          ),
        )
        .toList();

    state = AsyncValue.data(updatedBuildSteps);
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
