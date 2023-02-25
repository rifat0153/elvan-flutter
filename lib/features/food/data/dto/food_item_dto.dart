// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:elvan/features/category/data/dto/build_step_dto.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'food_item_dto.freezed.dart';
// part 'food_item_dto.g.dart';

// FoodItemDto foodItemDtoFromJson(String str) => FoodItemDto.fromJson(json.decode(str));
// String foodItemDtoToJson(FoodItemDto data) => json.encode(data.toJson());

// @Freezed()
// class FoodItemDto with _$FoodItemDto {
//   @JsonSerializable(explicitToJson: true)
//   const factory FoodItemDto({
//     String? id,
//     required String title,
//     required double price,
//     double? discount,
//     String? categoryId,
//     String? categoryTitle,
//     String? description,
//     String? imageUrl,
//     @Default(false)
//         bool isTopPick,
//     @Default(0)
//         int quantity,
//     @Default([])
//         List<String> tags,
//     @Default([])
//         List<String> ingredients,
//     @Default([])
//         List<BuildStepDto> buildStepsOverrides,
//     @Default([])
//         List<String> allergens,
//     int? timeToPrepareInMinutes,
//     @JsonKey(
//       fromJson: TimestampConverter.timestampFromJson,
//       toJson: TimestampConverter.timestampToJson,
//     )
//         Timestamp? createdAt,
//   }) = _FoodItemDto;

//   factory FoodItemDto.fromJson(Map<String, dynamic> json) => _$FoodItemDtoFromJson(json);
// }
