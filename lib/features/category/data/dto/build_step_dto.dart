import 'package:elvan/features/category/data/dto/add_on_dto.dart';
import 'package:elvan/features/category/domain/models/add_on/add_on.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_step_dto.freezed.dart';
part 'build_step_dto.g.dart';

@freezed
class BuildStepDto with _$BuildStepDto {
  const BuildStepDto._();

  @JsonSerializable(explicitToJson: true)
  const factory BuildStepDto({
    required String title,
    @Default(false) bool isRequired,
    @Default(0) int noOfItemIncludedInPrice,
    @Default(0) int minSelectedAddOns,
    int? maxSelectedAddOns,
    @Default([]) List<AddOnDto> addOns,
  }) = _FoodItemBuildStepDtos;

  factory BuildStepDto.fromJson(Map<String, dynamic> json) => _$BuildStepDtoFromJson(json);
}
