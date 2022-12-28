import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:elvan/features/category/data/dto/build_step_dto.dart';
import 'package:elvan/features/category/domain/models/add_on/add_on.dart';

part 'build_step.freezed.dart';
part 'build_step.g.dart';

@freezed
class BuildStep with _$BuildStep {
  const BuildStep._();

  @JsonSerializable(explicitToJson: true)
  const factory BuildStep({
    String? id,
    required String title,
    @Default(false) bool isRequired,
    @Default(0) int noOfItemIncludedInPrice,
    @Default(0) int minSelectedAddOns,
    @Default(10) int maxSelectedAddOns,
    @Default([]) List<AddOn> addOns,
  }) = _FoodItemBuildSteps;

  bool minAddOnsSelected() {
    return addOns
            .where(
              (element) => element.isSelected,
            )
            .length >=
        minSelectedAddOns;
  }

  bool maxAddOnsSelected() {
    return addOns
            .where(
              (element) => element.isSelected,
            )
            .length <=
        maxSelectedAddOns;
  }

  double get price {
    double price = 0;

    final selectedAddOns = addOns
        .where(
          (element) => element.isSelected,
        )
        .toList();

    for (int i = 0; i < selectedAddOns.length; i++) {
      // dont include addOns that are not included in price
      if (i >= noOfItemIncludedInPrice) {
        price += selectedAddOns[i].price;
      }
    }
    return price;
  }

  factory BuildStep.fromJson(Map<String, dynamic> json) => _$BuildStepFromJson(json);

  factory BuildStep.fromDto(BuildStepDto dto) {
    return BuildStep(
      id: dto.id,
      title: dto.title,
      isRequired: dto.isRequired,
      noOfItemIncludedInPrice: dto.noOfItemIncludedInPrice,
      minSelectedAddOns: dto.minSelectedAddOns,
      maxSelectedAddOns: dto.maxSelectedAddOns,
      addOns: dto.addOns
          .map(
            (e) => AddOn.fromDto(e),
          )
          .toList(),
    );
  }

  BuildStepDto toDto() {
    return BuildStepDto(
      id: id,
      title: title,
      isRequired: isRequired,
      noOfItemIncludedInPrice: noOfItemIncludedInPrice,
      minSelectedAddOns: minSelectedAddOns,
      maxSelectedAddOns: maxSelectedAddOns,
      addOns: addOns
          .map(
            (e) => e.toDto(),
          )
          .toList(),
    );
  }
}
