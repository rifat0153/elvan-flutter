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
    @Default(0) int noOfItemIncludedInPrice,
    @Default(0) int minSelectedAddOns,
    int? maxSelectedAddOns,
    @Default([]) List<AddOn> addOns,
  }) = _FoodItemBuildSteps;

  factory BuildStep.fromJson(Map<String, dynamic> json) => _$BuildStepFromJson(json);
}
