import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/order/data/dto/food_item_customized_dto.dart';
import 'package:elvan/features/order/domain/models/build_step_customized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_customized.freezed.dart';
part 'food_item_customized.g.dart';

@Freezed()
class FoodItemCustomized with _$FoodItemCustomized {
  const FoodItemCustomized._();

  factory FoodItemCustomized.fromFoodAndBuildInfo(FoodItem foodItem, [List<BuildStep> buildSteps = const <BuildStep>[]]) {
    return FoodItemCustomized._internal(
      id: DateTime.now().toString(),
      foodItem: foodItem,
      buildStepsCustomized: buildSteps.map((e) => BuildStepCustomized.fromBuildStep(e)).toList(),
    );
  }

  @JsonSerializable(explicitToJson: true)
  const factory FoodItemCustomized._internal({
    required String id,
    required FoodItem foodItem,
    required List<BuildStepCustomized> buildStepsCustomized,
  }) = _FoodItemCustomized;

  // get total price
  double get totalPrice {
    double price = foodItem.price;

    for (int i = 0; i < buildStepsCustomized.length; i++) {
      price += buildStepsCustomized[i].price;
    }
    return price;
  }

  factory FoodItemCustomized.fromJson(Map<String, dynamic> json) => _$FoodItemCustomizedFromJson(json);

  factory FoodItemCustomized.fromDto(FoodItemCustomizedDto dto) {
    return FoodItemCustomized._internal(
      id: dto.id,
      foodItem: dto.foodItem,
      buildStepsCustomized: dto.buildStepsCustomized
          .map(
            (e) => BuildStepCustomized.fromDto(e),
          )
          .toList(),
    );
  }
}
