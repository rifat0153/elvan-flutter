import 'package:elvan/features/food/models/add_on/add_on.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_step.freezed.dart';
part 'build_step.g.dart';

@freezed
class BuildStep with _$BuildStep {
  const BuildStep._();

  @JsonSerializable(explicitToJson: true)
  const factory BuildStep({
    required String title,
    @Default(false) bool isRequired,
    @Default(false) bool incluedInPrice,
    int? maxQuantity,
    int? minQuantity,
    @Default([]) List<AddOn> addOns,
    @Default([]) List<AddOn> selectedAddOns,
  }) = _FoodItemBuildSteps;

  bool isValueValid() {
    if (maxQuantity != null && selectedAddOns.length > maxQuantity!) {
      return false;
    }
    if (minQuantity != null && selectedAddOns.length < minQuantity!) {
      return false;
    }
    return true;
  }

  factory BuildStep.fromJson(Map<String, dynamic> json) => _$BuildStepFromJson(json);
}
