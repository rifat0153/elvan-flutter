// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:elvan/features/auth/data/dto/elvan_user_dto.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'elvan_user.freezed.dart';
// part 'elvan_user.g.dart';

// @freezed
// class ElvanUser with _$ElvanUser {
//   const ElvanUser._();

//   const factory ElvanUser({
//     String? id,
//     String? uid,
//     String? name,
//     String? email,
//     String? imageUrl,
//     String? phone,
//     String? address,
//     String? role,
//     @Default(0)
//         double totalSpent,
//     @Default(0)
//         int totalOrders,
//     @Default(0)
//         int totalOrdersCancelled,
//     @Default(0)
//         int totalOrdersDelivered,
//     @Default(0)
//         int totalOrdersPending,
//     @Default(0)
//         int totalOrdersRejected,
//     @JsonKey(
//       fromJson: TimestampConverter.timestampFromJson,
//       toJson: TimestampConverter.timestampToJson,
//     )
//         Timestamp? createdAt,
//   }) = _ElvanUser;

//   factory ElvanUser.fromJson(Map<String, dynamic> json) => _$ElvanUserFromJson(json);

//   factory ElvanUser.fromDto(ElvanUserDto elvanUserDto) => ElvanUser(
//         id: elvanUserDto.id,
//         uid: elvanUserDto.uid,
//         name: elvanUserDto.name,
//         email: elvanUserDto.email,
//         imageUrl: elvanUserDto.imageUrl,
//         phone: elvanUserDto.phone,
//         address: elvanUserDto.address,
//         role: elvanUserDto.role,
//         totalSpent: elvanUserDto.totalSpent,
//         totalOrders: elvanUserDto.totalOrders,
//         totalOrdersCancelled: elvanUserDto.totalOrdersCancelled,
//         totalOrdersDelivered: elvanUserDto.totalOrdersDelivered,
//         totalOrdersPending: elvanUserDto.totalOrdersPending,
//         totalOrdersRejected: elvanUserDto.totalOrdersRejected,
//         createdAt: elvanUserDto.createdAt,
//       );

//   ElvanUserDto toDto() => ElvanUserDto(
//         id: id,
//         uid: uid,
//         name: name,
//         email: email,
//         imageUrl: imageUrl,
//         phone: phone,
//         address: address,
//         role: role,
//         totalSpent: totalSpent,
//         totalOrders: totalOrders,
//         totalOrdersCancelled: totalOrdersCancelled,
//         totalOrdersDelivered: totalOrdersDelivered,
//         totalOrdersPending: totalOrdersPending,
//         totalOrdersRejected: totalOrdersRejected,
//         createdAt: createdAt,
//       );
// }
