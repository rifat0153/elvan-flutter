import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';

final buildStepsUseCaseProvider = Provider<BuildStepsUseCase>(
  (ref) => BuildStepsUseCase(),
);

class BuildStepsUseCase {
  List<BuildStep> toggleAddOnIsSelectedState(
    List<BuildStep> buildSteps,
    AddOnQuantityAction action,
    String addOnId,
    String buildStepId,
  ) {
    final buildStep = buildSteps.firstWhere((e) => e.id == buildStepId);
    final addOn = buildStep.addOns.firstWhere((e) => e.id == addOnId);
    final isRemoving = addOn.isSelected && action == AddOnQuantityAction.toggleIsSelected;

    // update addOn
    final updatedAddOn = addOn.copyWith(
      isSelected: !addOn.isSelected,
    );

    final updatedAddOns = buildStep.addOns.map((e) {
      if (e.id == addOnId) {
        return updatedAddOn;
      }
      return e;
    }).toList();

    // update build step
    final updatedBuildStep = buildStep.copyWith(
      addOns: updatedAddOns,
    );

    final shouldAddPrice = isRemoving ? false : updatedBuildStep.shouldAddPriceToTotal;
    final addUpdatedWithIncludedInPrice = updatedAddOn.copyWith(includeInPrice: shouldAddPrice);

    final addOnsUpdated = updatedBuildStep.addOns.map((e) {
      if (e.id == addOnId) {
        return addUpdatedWithIncludedInPrice;
      }
      return e;
    }).toList();

    final updatedBuildStepWithAddOns = updatedBuildStep.copyWith(
      addOns: addOnsUpdated,
    );

    // update addOn is included in price
    // update build step error
    final buildStepWithErrors = updatedBuildStepWithAddOns.copyWith(
      error: updatedBuildStep.buildStepsError,
    );

    final updatedBuildSteps = buildSteps.map((e) {
      if (e.id == buildStepId) {
        return buildStepWithErrors;
      }
      return e;
    }).toList();

    return updatedBuildSteps;
  }
}
