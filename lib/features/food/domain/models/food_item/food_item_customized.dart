import 'package:elvan/features/category/domain/models/build_step/build_step_customized.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_customized.freezed.dart';
part 'food_item_customized.g.dart';

@Freezed()
class FoodItemCustomized with _$FoodItemCustomized {
  const FoodItemCustomized._();

  @JsonSerializable(explicitToJson: true)
  const factory FoodItemCustomized({
    required String id,
    required FoodItem foodItem,
    @Default([]) List<BuildStepCustomized> buildSteps,
  }) = _FoodItemCustomized;

  // get total price
  double get totalPrice {
    double price = foodItem.price;

    for (int i = 0; i < buildSteps.length; i++) {
      price += buildSteps[i].price;
    }
    return price;
  }

  factory FoodItemCustomized.fromJson(Map<String, dynamic> json) => _$FoodItemCustomizedFromJson(json);
}
