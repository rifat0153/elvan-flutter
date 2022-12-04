import 'package:elvan/features/food/models/add_on/add_on.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_add_on.freezed.dart';
part 'selected_add_on.g.dart';

@freezed
class SelectedAddOn with _$SelectedAddOn {
  const SelectedAddOn._();

  const factory SelectedAddOn({
    required AddOn addOn,
    String? imageUrl,
    required DateTime createdAt,
    @Default(1) int quantity,
  }) = _SelectedAddOn;

  // get price
  double get price => addOn.price * quantity;

  factory SelectedAddOn.fromJson(Map<String, dynamic> json) => _$SelectedAddOnFromJson(json);
}
