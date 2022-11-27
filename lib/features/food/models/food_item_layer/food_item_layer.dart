import 'package:elvan/features/food/models/food_item_add_on/food_item_add_on.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_layer.freezed.dart';
part 'food_item_layer.g.dart';

@freezed
class FoodItemLayer with _$FoodItemLayer {
  @JsonSerializable(explicitToJson: true)
  const factory FoodItemLayer({
    required String title,
    @Default(false) bool isRequired,
    @Default(false) bool incluedInPrice,
    int? maxQuantity,
    int? minQuantity,
    @Default([]) List<FoodItemAddOn> addOns,
  }) = _FoodItemLayer;

  factory FoodItemLayer.fromJson(Map<String, dynamic> json) => _$FoodItemLayerFromJson(json);
}
