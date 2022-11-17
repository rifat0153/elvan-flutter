import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

FoodItem foodItemFromJson(String str) => FoodItem.fromJson(json.decode(str));

String foodItemToJson(FoodItem data) => json.encode(data.toJson());

@freezed
class FoodItem with _$FoodItem {
  @JsonSerializable(explicitToJson: true)
  const factory FoodItem({
    String? id,
    String? title,
    String? category,
    String? description,
    double? price,
    double? discount,
    String? imageUrl,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) => _$FoodItemFromJson(json);
}
