import 'package:elvan/features/food/models/add_on/add_on.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_step.freezed.dart';
part 'build_step.g.dart';

@freezed
class BuildStep with _$BuildStep {
  const BuildStep._();

  @JsonSerializable(explicitToJson: true)
  const factory BuildStep({
    required String title,
    @Default(false) bool isRequired,
    @Default(0) int noOfItemIncludedInPrice,
    int? maxQuantity,
    int? minQuantity,
    @Default([]) List<AddOn> addOns,
    @Default([]) List<AddOn> selectedAddOns,
  }) = _FoodItemBuildSteps;

  double get price {
    double price = 0;
    for (int i = 0; i < selectedAddOns.length; i++) {
      price += selectedAddOns[i].price;
    }
    // if (incluedInPrice) {
    //   price += addOns.fold(0, (previousValue, element) => previousValue + element.price);
    // }
    return price;
  }

  factory BuildStep.fromJson(Map<String, dynamic> json) => _$BuildStepFromJson(json);
}
