import 'package:elvan/core/logger/colored_print_log.dart';
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
    @Default(false) bool isValid,
    @Default(false) bool isRequired,
    @Default(0) int noOfItemIncludedInPrice,
    @Default(0) int minSelectedAddOns,
    @Default(10) int maxSelectedAddOns,
    @Default([]) List<AddOn> addOns,
    String? error,
  }) = _FoodItemBuildSteps;

  bool get shouldAddPriceToTotal {
    return selectedAddOnsCount > noOfItemIncludedInPrice;
  }

  String get buildStepSubHeading {
    if (isRequired) {
      if (selectedAddOnsCount < noOfItemIncludedInPrice) {
        return 'Choose $selectedAddOnsCount/$minSelectedAddOns addOns';
      }

      return 'Choose $selectedAddOnsCount selected addOns';
    }
    return 'Select up to $maxSelectedAddOns addOns';
  }

  String? get buildStepsError {
    if (isRequired && !isAddOnsValid) {
      return 'Please select at least $minSelectedAddOns addOns';
    }
    return null;
  }

  int get selectedAddOnsCount {
    return addOns
        .where(
          (addOn) => addOn.isSelected,
        )
        .length;
  }

  bool get isAddOnsValid {
    return minAddOnsSelected() && maxAddOnsSelected();
  }

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
          (element) => element.isSelected && element.includeInPrice,
        )
        .toList();

    for (int i = 0; i < selectedAddOns.length; i++) {
      // dont include addOns that are not included in price
      logError('Add on price ${selectedAddOns[i].title}: ${selectedAddOns[i].price}');
      if (i >= noOfItemIncludedInPrice) {
        logError('Adding Price to total ---> ${selectedAddOns[i].title}: ${selectedAddOns[i].price}');
        price += selectedAddOns[i].price;
      }
    }
    return price;
  }
  // double get price {
  //   double price = 0;

  //   final selectedAddOns = addOns
  //       .where(
  //         (element) => element.isSelected,
  //       )
  //       .toList();

  //   for (int i = 0; i < selectedAddOns.length; i++) {
  //     // dont include addOns that are not included in price
  //     logError('Add on price ${selectedAddOns[i].title}: ${selectedAddOns[i].price}');
  //     if (i >= noOfItemIncludedInPrice) {
  //       logError('Adding Price to total ---> ${selectedAddOns[i].title}: ${selectedAddOns[i].price}');
  //       price += selectedAddOns[i].price;
  //     }
  //   }
  //   return price;
  // }

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
