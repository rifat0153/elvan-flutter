// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
// import 'package:elvan/features/order/data/dto/order_dto.dart';
// import 'package:elvan/features/order/data/dto/order_status_dto.dart';
// import 'package:elvan/features/order/domain/models/order_status.dart';
// import 'package:elvan_shared/domain_models/index.dart';
// import 'package:elvan_shared/dtos/order/order_dto.dart';
// import 'package:elvan_shared/dtos/order/order_status_dto.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';

// part 'order.freezed.dart';
// part 'order.g.dart';

// @freezed
// class Order with _$Order {
//   const Order._();

//   @JsonSerializable(explicitToJson: true)
//   const factory Order({
//     required String id,
//     required String userId,
//     required List<CartItem> items,
//     required double total,
//     required double discount,
//     required double subTotal,
//     @JsonKey(
//       fromJson: OrderStatus.fromDto,
//       toJson: OrderStatus.toJson,
//     )
//         required OrderStatus status,
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

//   factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

//   factory Order.fromDto(OrderDto orderDto) => Order(
//         id: orderDto.id,
//         userId: orderDto.userId,
//         items: orderDto.items.map((e) => CartItem.fromDto(e)).toList(),
//         total: orderDto.total,
//         discount: orderDto.discount,
//         subTotal: orderDto.subTotal,
//         status: OrderStatus.fromDto(orderDto.status),
//         paymentMethod: orderDto.paymentMethod,
//         paymentStatus: orderDto.paymentStatus,
//         instructions: orderDto.instructions,
//         createdAt: orderDto.createdAt,
//       );

//   OrderDto toDto() => OrderDto(
//         id: id,
//         userId: userId,
//         items: items.map((e) => e.toDto()).toList(),
//         total: total,
//         discount: discount,
//         subTotal: subTotal,
//         status: status.toDto(),
//         paymentMethod: paymentMethod,
//         paymentStatus: paymentStatus,
//         instructions: instructions,
//         createdAt: createdAt,
//       );
// }
