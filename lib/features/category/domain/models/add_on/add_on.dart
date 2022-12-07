import 'package:elvan/features/category/data/dto/add_on_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_on.freezed.dart';
part 'add_on.g.dart';

@freezed
class AddOn with _$AddOn {
  const AddOn._();
  
  const factory AddOn({
    required String title,
    required double price,
    String? imageUrl,
  }) = _AddOn;

  factory AddOn.fromJson(Map<String, dynamic> json) => _$AddOnFromJson(json);

  factory AddOn.fromDto(AddOnDto dto) => AddOn(
        title: dto.title,
        price: dto.price,
        imageUrl: dto.imageUrl,
      );

  AddOnDto toDto() => AddOnDto(
        title: title,
        price: price,
        imageUrl: imageUrl,
      );
}
