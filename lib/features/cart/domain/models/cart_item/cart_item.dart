import 'package:elvan/features/cart/data/dto/cart_item_dto.dart';
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
    @Default([]) List<String> instructions,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

  factory CartItem.fromDto(CartItemDto cartItemDto) {
    return CartItem(
      id: cartItemDto.id,
      foodItemCustomized: FoodItemCustomized.fromDto(cartItemDto.foodItemCustomized),
      price: cartItemDto.price,
      quantity: cartItemDto.quantity,
      discount: cartItemDto.discount,
      instructions: cartItemDto.instructions,
    );
  }
}
