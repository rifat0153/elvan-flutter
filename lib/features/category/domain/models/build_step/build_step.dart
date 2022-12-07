import 'package:elvan/features/category/data/dto/build_step_dto.dart';
import 'package:elvan/features/category/domain/models/add_on/add_on.dart';
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

  factory BuildStep.fromDto(BuildStepDto foodItemBuildStepDto) {
    return BuildStep(
      title: foodItemBuildStepDto.title,
      isRequired: foodItemBuildStepDto.isRequired,
      noOfItemIncludedInPrice: foodItemBuildStepDto.noOfItemIncludedInPrice,
      minSelectedAddOns: foodItemBuildStepDto.minSelectedAddOns,
      maxSelectedAddOns: foodItemBuildStepDto.maxSelectedAddOns,
      addOns: foodItemBuildStepDto.addOns.map((e) => AddOn.fromDto(e)).toList(),
    );
  }

  BuildStepDto toDto() {
    return BuildStepDto(
      title: title,
      isRequired: isRequired,
      noOfItemIncludedInPrice: noOfItemIncludedInPrice,
      minSelectedAddOns: minSelectedAddOns,
      maxSelectedAddOns: maxSelectedAddOns,
      addOns: addOns.map((e) => e.toDto()).toList(),
    );
  }
}
