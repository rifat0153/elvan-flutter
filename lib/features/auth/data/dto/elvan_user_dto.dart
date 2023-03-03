// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'elvan_user_dto.freezed.dart';
// part 'elvan_user_dto.g.dart';

// @freezed
// class ElvanUserDto with _$ElvanUserDto {
//   const factory ElvanUserDto({
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
//   }) = _ElvanUserDto;

//   factory ElvanUserDto.fromJson(Map<String, dynamic> json) => _$ElvanUserDtoFromJson(json);
// }
