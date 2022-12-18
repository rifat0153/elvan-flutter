import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/order/data/dto/add_on_customized_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_step_customized_dto.freezed.dart';
part 'build_step_customized_dto.g.dart';

@freezed
class BuildStepCustomizedDto with _$BuildStepCustomizedDto {
  const BuildStepCustomizedDto._();

  @JsonSerializable(explicitToJson: true)
  const factory BuildStepCustomizedDto({
    required BuildStep buildStep,
    @Default([]) List<AddOnCustomizedDto> addOnsCustomized,
  }) = _FoodItemBuildStepCustomizedDto;

  factory BuildStepCustomizedDto.fromJson(Map<String, dynamic> json) => _$BuildStepCustomizedDtoFromJson(json);
}
