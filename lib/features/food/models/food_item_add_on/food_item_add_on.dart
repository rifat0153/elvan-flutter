import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_add_on.freezed.dart';
part 'food_item_add_on.g.dart';

@freezed
class FoodItemAddOn with _$FoodItemAddOn {
  const factory FoodItemAddOn({
    required String title,
    required double price,
    @Default(1) int quantity,
  }) = _FoodItemAddOn;

  factory FoodItemAddOn.fromJson(Map<String, dynamic> json) => _$FoodItemAddOnFromJson(json);
}
