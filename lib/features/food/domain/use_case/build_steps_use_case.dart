import 'dart:collection';

import 'package:elvan/features/category/domain/models/add_on/add_on.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/category/domain/models/build_step/build_step.dart';

final buildStepsUseCaseProvider = Provider<BuildStepsUseCase>(
  (ref) => BuildStepsUseCase(),
);

class BuildStepsUseCase {
  List<BuildStep> toggleAddOnIsSelectedState(
    List<BuildStep> buildSteps,
    String addOnId,
    String buildStepId,
  ) {
    BuildStep buildStep = buildSteps.firstWhere((e) => e.id == buildStepId);
    AddOn addOn = buildStep.addOns.firstWhere((e) => e.id == addOnId);
    final bool isRemovingAddOn = addOn.isSelected;

    // if the addOn is being removed,
    // then we need to check if the next addOn should be included in price
    if (isRemovingAddOn) {
      final nextSelectedAddOnSize = buildStep.selectedAddOnsCount - 1;

      // Remove all the addOns that are included in price
      if (nextSelectedAddOnSize <= buildStep.noOfItemIncludedInPrice) {
        buildStep = buildStep.copyWith(
          addOns: buildStep.addOns
              .map(
                (e) => e.copyWith(includeInPrice: false),
              )
              .toList(),
        );
      }
    }

    // update addOn
    final updatedAddOn = addOn.copyWith(
      isSelected: !addOn.isSelected,
      includeInPrice: isRemovingAddOn ? false : buildStep.shouldNextAddOnBeIncludedInPrice,
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

    final updatedBuildSteps = buildSteps.map((e) {
      if (e.id == buildStepId) {
        return updatedBuildStep;
      }
      return e;
    }).toList();

    final buildStepsWithError = updateBuildStepsError(
      buildSteps: updatedBuildSteps,
      buildStepId: buildStepId,
    );

    return buildStepsWithError;
  }

  List<BuildStep> updateBuildStepsError({
    required List<BuildStep> buildSteps,
    required String buildStepId,
  }) {
    final updatedBuildSteps = buildSteps.map((e) {
      if (e.id == buildStepId) {
        return e.copyWith(error: e.buildStepsError);
      }
      return e;
    }).toList();

    return updatedBuildSteps;
  }
}
