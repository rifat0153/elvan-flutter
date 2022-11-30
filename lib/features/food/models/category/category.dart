import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/extensions/timestamp/timestamp_json_converter.dart';
import 'package:elvan/features/food/models/food_item_add_on/food_item_add_on.dart';
import 'package:elvan/features/food/models/food_item_build_step/food_item_build_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@Freezed()
class Category with _$Category {
  const factory Category({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    @Default([])
        List<BuildStep> buildSteps,
    @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson,
    )
        Timestamp? createdAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
