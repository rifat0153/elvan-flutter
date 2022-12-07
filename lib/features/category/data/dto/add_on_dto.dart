import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_on_dto.freezed.dart';
part 'add_on_dto.g.dart';

@freezed
class AddOnDto with _$AddOnDto {
  const factory AddOnDto({
    required String title,
    required double price,
    String? imageUrl,
  }) = _AddOnDto;

  factory AddOnDto.fromJson(Map<String, dynamic> json) => _$AddOnDtoFromJson(json);
}
