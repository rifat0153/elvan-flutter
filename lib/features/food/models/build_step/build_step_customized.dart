import 'package:elvan/features/food/models/add_on/add_on.dart';
import 'package:elvan/features/food/models/add_on/selected_add_on.dart';
import 'package:elvan/features/food/models/build_step/build_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_step_customized.freezed.dart';
part 'build_step_customized.g.dart';

@freezed
class BuildStepCustomized with _$BuildStepCustomized {
  const BuildStepCustomized._();

  @JsonSerializable(explicitToJson: true)
  const factory BuildStepCustomized({
    required BuildStep buildStep,
    @Default([]) List<SelectedAddOn> selectedAddOns,
  }) = _FoodItemBuildStepCustomizeds;

  bool get isAddOnsSelected => selectedAddOns.isNotEmpty;
  bool get areAddOnsSelectionValid => selectedAddOns.length >= buildStep.minSelectedAddOns;

  bool addOnsConditionMet() {
    return minAddOnsSelected() && !maxAddOnsSelected();
  }

  bool minAddOnsSelected() {
    return selectedAddOns.length >= buildStep.minSelectedAddOns;
  }

  bool maxAddOnsSelected() {
    if (buildStep.maxSelectedAddOns == null) {
      return false;
    }
    return selectedAddOns.length >= buildStep.maxSelectedAddOns!;
  }

  double get price {
    double price = 0;

    // sort selectedAddOns by createdAt
    final sortedAddOns = selectedAddOns;
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

  factory BuildStepCustomized.fromJson(Map<String, dynamic> json) => _$BuildStepCustomizedFromJson(json);
}
