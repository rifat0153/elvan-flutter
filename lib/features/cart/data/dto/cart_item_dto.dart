// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:elvan/features/category/data/dto/build_step_dto.dart';
// import 'package:elvan/features/food/data/dto/food_item_dto.dart';

// part 'cart_item_dto.freezed.dart';
// part 'cart_item_dto.g.dart';

// @freezed
// class CartItemDto with _$CartItemDto {
//   const CartItemDto._();

//   @JsonSerializable(explicitToJson: true)
//   const factory CartItemDto({
//     required String id,
//     required FoodItemDto foodItem,
//     required List<BuildStepDto> buildSteps,
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

//   factory CartItemDto.fromJson(Map<String, dynamic> json) => _$CartItemDtoFromJson(json);
// }
