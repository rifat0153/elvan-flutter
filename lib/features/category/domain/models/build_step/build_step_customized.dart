import 'package:elvan/features/category/domain/models/add_on/add_on_customized.dart';
import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_step_customized.freezed.dart';
part 'build_step_customized.g.dart';

@freezed
class BuildStepCustomized with _$BuildStepCustomized {
  const BuildStepCustomized._();

  @JsonSerializable(explicitToJson: true)
  const factory BuildStepCustomized({
    required BuildStep buildStep,
    @Default([]) List<AddOnCustomized> addOnsCustomized,
  }) = _FoodItemBuildStepCustomizeds;

  bool get isAddOnsSelected => addOnsCustomized.isNotEmpty;
  bool get areAddOnsSelectionValid => addOnsCustomized.length >= buildStep.minSelectedAddOns;

  bool addOnsConditionMet() {
    return minAddOnsSelected() && !maxAddOnsSelected();
  }

  bool minAddOnsSelected() {
    return addOnsCustomized.length >= buildStep.minSelectedAddOns;
  }

  bool maxAddOnsSelected() {
    if (buildStep.maxSelectedAddOns == null) {
      return false;
    }
    return addOnsCustomized.length >= buildStep.maxSelectedAddOns!;
  }

  double get price {
    double price = 0;

    // sort selectedAddOns by createdAt
    final sortedAddOns = addOnsCustomized;
    sortedAddOns.sort((a, b) => a.createdAt.compareTo(b.createdAt));

    for (int i = 0; i < sortedAddOns.length; i++) {
      // dont include addOns that are not included in price
      // we already sorted the selected addons by createdAt
      if (i >= buildStep.noOfItemIncludedInPrice) {
        price += sortedAddOns[i].price;
      }
    }
    return price;
  }

  factory BuildStepCustomized.fromBuildStep(BuildStep buildStep) {
    return BuildStepCustomized(
      buildStep: buildStep,
      addOnsCustomized: [],
    );
  }

  factory BuildStepCustomized.fromJson(Map<String, dynamic> json) => _$BuildStepCustomizedFromJson(json);
}
