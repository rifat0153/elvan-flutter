import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
import 'package:elvan/features/category/data/dto/category_dto.dart';
import 'package:elvan/features/food/models/build_step/build_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.g.dart';
part 'category.freezed.dart';

@Freezed()
class Category with _$Category {
  const Category._();
  
  @JsonSerializable(explicitToJson: true)
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

  factory Category.fromDto(CategoryDto categoryDto) {
    return Category(
      id: categoryDto.id,
      title: categoryDto.title,
      description: categoryDto.description,
      imageUrl: categoryDto.imageUrl,
      buildSteps: categoryDto.buildSteps,
      createdAt: categoryDto.createdAt,
    );
  }

  CategoryDto toDto() => CategoryDto(
        id: id,
        title: title,
        description: description,
        imageUrl: imageUrl,
        buildSteps: buildSteps,
        createdAt: createdAt,
      );
}
