// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
// import 'package:elvan/features/food/data/dto/food_item_dto.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'food_item.freezed.dart';
// part 'food_item.g.dart';

// FoodItem foodItemFromJson(String str) => FoodItem.fromJson(json.decode(str));
// String foodItemToJson(FoodItem data) => json.encode(data.toJson());

// @Freezed()
// class FoodItem with _$FoodItem {
//   const FoodItem._();

//   @JsonSerializable(explicitToJson: true)
//   const factory FoodItem({
//     String? id,
//     required String title,
//     required double price,
//     required String categoryId,
//     required String categoryTitle,
//     double? discount,
//     @Default(false)
//         bool isTopPick,
//     String? description,
//     String? imageUrl,
//     @Default(false)
//         bool isFavorite,
//     @Default(0)
//         int quantity,
//     @Default([])
//         List<String> tags,
//     @Default([])
//         List<String> ingredients,
//     @Default([])
//         List<BuildStep> buildStepsOverrides,
//     @Default([])
//         List<String> allergens,
//     int? timeToPrepareInMinutes,
//     @JsonKey(
//       fromJson: TimestampConverter.timestampFromJson,
//       toJson: TimestampConverter.timestampToJson,
//     )
//         Timestamp? createdAt,
//   }) = _FoodItem;

//   factory FoodItem.fromDto(FoodItemDto foodItemDto) {
//     return FoodItem(
//       id: foodItemDto.id,
//       title: foodItemDto.title,
//       price: foodItemDto.price,
//       discount: foodItemDto.discount,
//       categoryId: foodItemDto.categoryId ?? '',
//       categoryTitle: foodItemDto.categoryTitle ?? '',
//       isTopPick: foodItemDto.isTopPick,
//       description: foodItemDto.description,
//       imageUrl: foodItemDto.imageUrl,
//       quantity: foodItemDto.quantity,
//       tags: foodItemDto.tags,
//       ingredients: foodItemDto.ingredients,
//       buildStepsOverrides: foodItemDto.buildStepsOverrides.map((e) => BuildStep.fromDto(e)).toList(),
//       allergens: foodItemDto.allergens,
//       timeToPrepareInMinutes: foodItemDto.timeToPrepareInMinutes,
//       createdAt: foodItemDto.createdAt,
//     );
//   }

//   FoodItemDto toDto() {
//     return FoodItemDto(
//       id: id,
//       title: title,
//       price: price,
//       discount: discount,
//       categoryId: categoryId,
//       categoryTitle: categoryTitle,
//       isTopPick: isTopPick,
//       description: description,
//       imageUrl: imageUrl,
//       quantity: quantity,
//       tags: tags,
//       ingredients: ingredients,
//       buildStepsOverrides: buildStepsOverrides.map((e) => e.toDto()).toList(),
//       allergens: allergens,
//       timeToPrepareInMinutes: timeToPrepareInMinutes,
//       createdAt: createdAt,
//     );
//   }

//   factory FoodItem.fromJson(Map<String, dynamic> json) => _$FoodItemFromJson(json);
// }
