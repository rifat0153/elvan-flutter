import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
import 'package:elvan/features/category/domain/models/add_on/add_on.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_on_customized_dto.freezed.dart';
part 'add_on_customized_dto.g.dart';

@freezed
class AddOnCustomizedDto with _$AddOnCustomizedDto {
  const AddOnCustomizedDto._();

  const factory AddOnCustomizedDto({
    required AddOn addOn,
    @Default(false)
        bool isSelected,
    @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson,
    )
        Timestamp? createdAt,
    @Default(1)
        int quantity,
  }) = _AddOnCustomized;

  factory AddOnCustomizedDto.fromJson(Map<String, dynamic> json) => _$AddOnCustomizedDtoFromJson(json);
}
