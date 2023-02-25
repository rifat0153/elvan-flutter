// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:elvan/features/category/data/dto/category_dto.dart';
// import 'package:elvan/features/category/domain/models/build_step/build_step.dart';

// part 'category.freezed.dart';
// part 'category.g.dart';

// @Freezed()
// class Category with _$Category {
//   const Category._();

//   @JsonSerializable(explicitToJson: true)
//   const factory Category({
//     String? id,
//     required String title,
//     @Default(false)
//         bool isSelected,
//     String? description,
//     String? imageUrl,
//     @Default([])
//         List<BuildStep> buildSteps,
//     @JsonKey(
//       fromJson: TimestampConverter.timestampFromJson,
//       toJson: TimestampConverter.timestampToJson,
//     )
//         Timestamp? createdAt,
//   }) = _Category;

//   factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

//   factory Category.fromDto(CategoryDto categoryDto) {
//     return Category(
//       id: categoryDto.id,
//       title: categoryDto.title,
//       description: categoryDto.description,
//       imageUrl: categoryDto.imageUrl,
//       buildSteps: categoryDto.buildSteps.map((e) => BuildStep.fromDto(e)).toList(),
//       createdAt: categoryDto.createdAt,
//     );
//   }

//   CategoryDto toDto() => CategoryDto(
//         id: id,
//         title: title,
//         description: description,
//         imageUrl: imageUrl,
//         buildSteps: buildSteps.map((e) => e.toDto()).toList(),
//         createdAt: createdAt,
//       );
// }
