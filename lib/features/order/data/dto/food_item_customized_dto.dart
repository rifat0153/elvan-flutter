import 'package:elvan/features/food/data/dto/food_item_dto.dart';
import 'package:elvan/features/order/data/dto/build_step_customized_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_customized_dto.freezed.dart';
part 'food_item_customized_dto.g.dart';

@Freezed()
class FoodItemCustomizedDto with _$FoodItemCustomizedDto {
  const FoodItemCustomizedDto._();

  @JsonSerializable(explicitToJson: true)
  const factory FoodItemCustomizedDto({
    required String id,
    required FoodItemDto foodItem,
    required List<BuildStepCustomizedDto> buildStepsCustomized,
  }) = _FoodItemCustomizedDto;

  factory FoodItemCustomizedDto.fromJson(Map<String, dynamic> json) => _$FoodItemCustomizedDtoFromJson(json);
}
