// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:elvan/features/category/data/dto/build_step_dto.dart';
// import 'package:elvan/features/category/domain/models/add_on/add_on.dart';

// part 'build_step.freezed.dart';
// part 'build_step.g.dart';

// @freezed
// class BuildStep with _$BuildStep {
//   const BuildStep._();

//   @JsonSerializable(explicitToJson: true)
//   const factory BuildStep({
//     String? id,
//     required String title,
//     @Default(false) bool isValid,
//     @Default(false) bool isRequired,
//     @Default(0) int noOfItemIncludedInPrice,
//     @Default(0) int minSelectedAddOns,
//     @Default(10) int maxSelectedAddOns,
//     @Default([]) List<AddOn> addOns,
//     String? error,
//   }) = _FoodItemBuildSteps;

//   double get price {
//     double price = 0;
//     for (var addOn in addOns) {
//       if (addOn.isSelected && addOn.includeInPrice && shouldAddPriceToTotal) {
//         price += addOn.price;
//       }
//     }
//     return price;
//   }

//   bool get shouldNextAddOnBeIncludedInPrice {
//     return selectedAddOnsCount + 1 > noOfItemIncludedInPrice;
//   }

//   bool get shouldAddPriceToTotal {
//     return selectedAddOnsCount > noOfItemIncludedInPrice;
//   }

//   String get buildStepSubHeading {
//     if (isRequired) {
//       if (selectedAddOnsCount < noOfItemIncludedInPrice) {
//         return 'Choose $selectedAddOnsCount/$minSelectedAddOns addOns';
//       }

//       return 'Choose $selectedAddOnsCount selected addOns';
//     }
//     return 'Select up to $maxSelectedAddOns addOns';
//   }

//   String? get buildStepsError {
//     if (isRequired && selectedAddOnsCount < minSelectedAddOns) {
//       return 'Please select at least $minSelectedAddOns addOns';
//     }
//     if (isRequired && selectedAddOnsCount > maxSelectedAddOns) {
//       return 'Please select at most $maxSelectedAddOns addOns';
//     }
//     return null;
//   }

//   int get selectedAddOnsCount {
//     return addOns
//         .where(
//           (addOn) => addOn.isSelected,
//         )
//         .length;
//   }

//   bool get isAddOnsValid {
//     if (!isRequired) return true;

//     return satisfiesMinContraint() && satisfiesMaxConstraint();
//   }

//   bool satisfiesMinContraint() {
//     return addOns
//             .where(
//               (element) => element.isSelected,
//             )
//             .length >=
//         minSelectedAddOns;
//   }

//   bool satisfiesMaxConstraint() {
//     return addOns
//             .where(
//               (element) => element.isSelected,
//             )
//             .length <=
//         maxSelectedAddOns;
//   }

//   factory BuildStep.fromJson(Map<String, dynamic> json) => _$BuildStepFromJson(json);

//   factory BuildStep.fromDto(BuildStepDto dto) {
//     return BuildStep(
//       id: dto.id,
//       title: dto.title,
//       isRequired: dto.isRequired,
//       noOfItemIncludedInPrice: dto.noOfItemIncludedInPrice,
//       minSelectedAddOns: dto.minSelectedAddOns,
//       maxSelectedAddOns: dto.maxSelectedAddOns,
//       addOns: dto.addOns
//           .map(
//             (e) => AddOn.fromDto(e),
//           )
//           .toList(),
//     );
//   }

//   BuildStepDto toDto() {
//     return BuildStepDto(
//       id: id,
//       title: title,
//       isRequired: isRequired,
//       noOfItemIncludedInPrice: noOfItemIncludedInPrice,
//       minSelectedAddOns: minSelectedAddOns,
//       maxSelectedAddOns: maxSelectedAddOns,
//       addOns: addOns
//           .map(
//             (e) => e.toDto(),
//           )
//           .toList(),
//     );
//   }
// }
