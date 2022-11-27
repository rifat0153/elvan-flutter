import 'package:elvan/features/food/models/food_item/food_item.dart';
import 'package:elvan/features/food/models/food_item_build_step/food_item_build_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  @JsonSerializable(explicitToJson: true)
  const factory CartItem({
    required String id,
    required FoodItem foodItem,
    required double price,
    required int quantity,
    required List<FoodItemBuildStep> buildSteps,
    double? discount,
    @Default('') String instructions,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}
