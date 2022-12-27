import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:elvan/features/order/data/dto/food_item_customized_dto.dart';

part 'cart_item_dto.freezed.dart';
part 'cart_item_dto.g.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();

  @JsonSerializable(explicitToJson: true)
  const factory CartItemDto({
    required String id,
    required FoodItemCustomizedDto foodItemCustomized,
    required double price,
    required int quantity,
    double? discount,
    @Default([]) List<String> instructions,
  }) = _CartItem;

  factory CartItemDto.fromJson(Map<String, dynamic> json) => _$CartItemDtoFromJson(json);
}
