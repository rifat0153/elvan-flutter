import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/extensions/timestamp/timestamp_json_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

FoodItem foodItemFromJson(String str) => FoodItem.fromJson(json.decode(str));
String foodItemToJson(FoodItem data) => json.encode(data.toJson());

@Freezed()
class FoodItem with _$FoodItem {
  @JsonSerializable(explicitToJson: true)
  const factory FoodItem({
    String? id,
    required String title,
    required double price,
    double? discount,
    String? category,
    String? description,
    String? imageUrl,
    @Default(0)
        int quantity,
    @Default([])
        String tags,
    @Default([])
        List<String> ingredients,
    @Default([])
        List<String> allergens,
    @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson,
    )
        timeToPrepareInMinutes,
    @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson,
    )
        Timestamp? createdAt,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) => _$FoodItemFromJson(json);
}
