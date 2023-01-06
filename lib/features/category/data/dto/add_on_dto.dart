// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'add_on_dto.freezed.dart';
// part 'add_on_dto.g.dart';

// @freezed
// class AddOnDto with _$AddOnDto {
//   const factory AddOnDto({
//     String? id,
//     required String title,
//     required double price,
//     String? imageUrl,
//     @Default(false)
//         bool isSelected,
//     @Default(0)
//         int quantitySelected,
//     @JsonKey(
//       fromJson: TimestampConverter.timestampFromJson,
//       toJson: TimestampConverter.timestampToJson,
//     )
//         Timestamp? createdAt,
//   }) = _AddOnDto;

//   factory AddOnDto.fromJson(Map<String, dynamic> json) => _$AddOnDtoFromJson(json);
// }
