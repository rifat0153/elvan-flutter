import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/core/extensions/timestamp/timestamp_json_converter.dart';
import 'package:elvan/features/category/domain/models/add_on/add_on.dart';
import 'package:elvan/features/order/data/dto/add_on_customized_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_on_customized.freezed.dart';
part 'add_on_customized.g.dart';

@freezed
class AddOnCustomized with _$AddOnCustomized {
  const AddOnCustomized._();

  const factory AddOnCustomized({
    required AddOn addOn,
    @Default(false)
        bool isSelected,
    @Default(1)
        int quantity,
    @JsonKey(
      fromJson: TimestampConverter.timestampFromJson,
      toJson: TimestampConverter.timestampToJson,
    )
        Timestamp? createdAt,
  }) = _AddOnCustomized;

  // get price
  double get price => addOn.price * quantity;

  factory AddOnCustomized.fromJson(Map<String, dynamic> json) => _$AddOnCustomizedFromJson(json);

  factory AddOnCustomized.fromAddOn(AddOn addOn) {
    return AddOnCustomized(
      addOn: addOn,
      isSelected: false,
      createdAt: Timestamp.now(),
      quantity: 1,
    );
  }

  factory AddOnCustomized.fromDto(AddOnCustomizedDto dto) {
    return AddOnCustomized(
      addOn: dto.addOn,
      isSelected: dto.isSelected,
      createdAt: dto.createdAt,
      quantity: dto.quantity,
    );
  }
}
