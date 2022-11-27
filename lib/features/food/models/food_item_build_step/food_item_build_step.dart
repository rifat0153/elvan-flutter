import 'package:elvan/features/food/models/food_item_add_on/food_item_add_on.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_build_step.freezed.dart';
part 'food_item_build_step.g.dart';

@freezed
class FoodItemBuildStep with _$FoodItemBuildStep {
  const FoodItemBuildStep._();

  @JsonSerializable(explicitToJson: true)
  const factory FoodItemBuildStep({
    required String title,
    @Default(false) bool isRequired,
    @Default(false) bool incluedInPrice,
    int? maxQuantity,
    int? minQuantity,
    @Default([]) List<FoodItemAddOn> addOns,
    @Default([]) List<String> selectedAddOns,
  }) = _FoodItemBuildSteps;

  factory FoodItemBuildStep.fromJson(Map<String, dynamic> json) => _$FoodItemBuildStepFromJson(json);
}
