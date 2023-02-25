// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:elvan/features/cart/data/dto/cart_item_dto.dart';
// import 'package:elvan/features/food/domain/models/food_item/food_item.dart';

// part 'cart_item.freezed.dart';
// part 'cart_item.g.dart';

// @freezed
// class CartItem with _$CartItem {
//   const CartItem._();

//   @JsonSerializable(explicitToJson: true)
//   const factory CartItem({
//     required String id,
//     required FoodItem foodItem,
//     required List<BuildStep> buildSteps,
//     required double price,
//     required int quantity,
//     double? discount,
//     @Default([])
//         List<String> instructions,
//     @JsonKey(
//       fromJson: TimestampConverter.timestampFromJson,
//       toJson: TimestampConverter.timestampToJson,
//     )
//         Timestamp? createdAt,
//   }) = _CartItem;

//   factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

//   factory CartItem.fromDto(CartItemDto dto) {
//     return CartItem(
//       id: dto.id,
//       foodItem: FoodItem.fromDto(dto.foodItem),
//       buildSteps: dto.buildSteps
//           .map(
//             (e) => BuildStep.fromDto(e),
//           )
//           .toList(),
//       price: dto.price,
//       quantity: dto.quantity,
//       discount: dto.discount,
//       instructions: dto.instructions,
//       createdAt: dto.createdAt,
//     );
//   }

//   CartItemDto toDto() {
//     return CartItemDto(
//       id: id,
//       foodItem: foodItem.toDto(),
//       buildSteps: buildSteps
//           .map(
//             (e) => e.toDto(),
//           )
//           .toList(),
//       price: price,
//       quantity: quantity,
//       discount: discount,
//       instructions: instructions,
//       createdAt: createdAt,
//     );
//   }
// }
