import 'package:elvan/features/order/data/dto/food_item_customized_dto.dart';
import 'package:elvan/features/order/domain/models/food_item_customized.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_dto.freezed.dart';
part 'cart_item_dto.g.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();

  @JsonSerializable(explicitToJson: true)
  const factory CartItemDto({
    required String id,
    FoodItemCustomizedDto? foodItemCustomized,
    required double price,
    required int quantity,
    double? discount,
    @Default([]) List<String> instructions,
  }) = _CartItem;

  factory CartItemDto.fromJson(Map<String, dynamic> json) => _$CartItemDtoFromJson(json);
}
