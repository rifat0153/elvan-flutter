// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:elvan/features/cart/data/dto/cart_item_dto.dart';
// import 'package:elvan/features/order/data/dto/order_status_dto.dart';

// part 'order_dto.freezed.dart';
// part 'order_dto.g.dart';

// @freezed
// class OrderDto with _$OrderDto {
//   @JsonSerializable(explicitToJson: true)
//   const factory OrderDto({
//     required String id,
//     required String userId,
//     @Default([])
//         List<CartItemDto> items,
//     required double total,
//     required double subTotal,
//     @Default(0)
//         double discount,
//     @JsonKey(
//       fromJson: OrderStatusDto.fromJson,
//       toJson: OrderStatusDto.toJson,
//     )
//         required OrderStatusDto status,
//     String? paymentMethod,
//     String? paymentStatus,
//     @Default([])
//         List<String> instructions,
//     @JsonKey(
//       fromJson: TimestampConverter.timestampFromJson,
//       toJson: TimestampConverter.timestampToJson,
//     )
//         Timestamp? createdAt,
//   }) = _Order;

//   factory OrderDto.fromJson(Map<String, dynamic> json) =>
//       _$OrderDtoFromJson(json);
// }
