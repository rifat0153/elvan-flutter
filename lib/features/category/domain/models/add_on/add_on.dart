// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
// import 'package:elvan/features/category/data/dto/add_on_dto.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'add_on.freezed.dart';
// part 'add_on.g.dart';

// @freezed
// class AddOn with _$AddOn {
//   const AddOn._();

//   const factory AddOn({
//     String? id,
//     required String title,
//     required double price,
//     @Default(false)
//         bool includeInPrice,
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
//   }) = _AddOn;

//   AddOn toggleIsSelected() => copyWith(isSelected: !isSelected);

//   AddOn incrementQuantity() => copyWith(quantitySelected: quantitySelected + 1);

//   AddOn decrementQuantity() => copyWith(quantitySelected: quantitySelected - 1);

//   factory AddOn.fromJson(Map<String, dynamic> json) => _$AddOnFromJson(json);

//   factory AddOn.fromDto(AddOnDto dto) => AddOn(
//         id: dto.id,
//         title: dto.title,
//         price: dto.price,
//         imageUrl: dto.imageUrl,
//         isSelected: dto.isSelected,
//         quantitySelected: dto.quantitySelected,
//         createdAt: dto.createdAt,
//       );

//   AddOnDto toDto() => AddOnDto(
//         id: id,
//         title: title,
//         price: price,
//         imageUrl: imageUrl,
//         isSelected: isSelected,
//         quantitySelected: quantitySelected,
//         createdAt: createdAt,
//       );
// }
