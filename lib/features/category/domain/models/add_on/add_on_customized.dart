import 'package:elvan/features/category/domain/models/add_on/add_on.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_on_customized.freezed.dart';
part 'add_on_customized.g.dart';

@freezed
class AddOnCustomized with _$AddOnCustomized {
  const AddOnCustomized._();

  const factory AddOnCustomized({
    required AddOn addOn,
    @Default(false) bool isSelected,
    required DateTime createdAt,
    @Default(1) int quantity,
  }) = _AddOnCustomized;

  // get price
  double get price => addOn.price * quantity;

  factory AddOnCustomized.fromJson(Map<String, dynamic> json) => _$AddOnCustomizedFromJson(json);
}
