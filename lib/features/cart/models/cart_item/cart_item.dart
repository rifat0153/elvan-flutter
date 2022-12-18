import 'package:elvan/features/order/domain/models/food_item_customized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  @JsonSerializable(explicitToJson: true)
  const factory CartItem({
    required String id,
    required FoodItemCustomized foodItemCustomized,
    required double price,
    required int quantity,
    double? discount,
    @Default('') String instructions,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}
