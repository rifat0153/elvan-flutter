// import 'package:collection/collection.dart';
// import 'package:elvan/core/logger/colored_print_log.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
// import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
// import 'package:elvan/features/food/domain/models/food_item/food_item.dart';

// part 'build_steps_notifier.g.dart';

// enum AddOnQuantityAction { increment, decrement, toggleIsSelected }

// @riverpod
// bool isBuildStepsValid(IsBuildStepsValidRef ref) {
//   final buildStepsAsyncValue = ref.watch(buildStepsNotifierProvider);

//   return buildStepsAsyncValue.maybeWhen(
//     data: (buildSteps) {
//       return buildSteps.every((e) => e.isAddOnsValid);
//     },
//     orElse: () => false,
//   );
// }

// @riverpod
// double currentBuildStepsPrice(CurrentBuildStepsPriceRef ref) {
//   final buildStepsAsyncValue = ref.watch(buildStepsNotifierProvider);

//   final double price = buildStepsAsyncValue.maybeWhen(
//     data: (buildSteps) {
//       return buildSteps.fold(
//         0,
//         (previousValue, bs) {
//           double addOnPrice = bs.addOns.fold(
//             previousValue,
//             (prev, addOn) {
//               if (addOn.isSelected && addOn.includeInPrice && bs.shouldAddPriceToTotal) {
//                 prev += addOn.price;
//               }
//               return prev;
//             },
//           );

//           return addOnPrice;
//         },
//       );
//     },
//     orElse: () => 0,
//   );

//   return price;
// }

// @Riverpod(keepAlive: true)
// class BuildStepsNotifier extends _$BuildStepsNotifier {
//   @override
//   FutureOr<List<BuildStep>> build() {
//     return [];
//   }

//   void resetAndSet(List<BuildStep> buildSteps) {
//     state = AsyncValue.data(buildSteps);
//   }

//   void updateAddOnIsIncludedInPrice(String buildStepId, String addOnId) {
//     final buildSteps = state.value ?? [];

//     final updatedBuildSteps = buildSteps.map(
//       (buildStep) {
//         if (buildStep.id == buildStepId) {
//           return buildStep.copyWith(
//             addOns: buildStep.addOns.map((addOn) {
//               final shouldIncludeInPrice = buildStep.shouldAddPriceToTotal;

//               if (addOn.id == addOnId) {
//                 return addOn.copyWith(includeInPrice: shouldIncludeInPrice);
//               }

//               return addOn;
//             }).toList(),
//           );
//         }

//         return buildStep;
//       },
//     ).toList();

//     state = AsyncValue.data(updatedBuildSteps);
//   }

//   void updateBuildStepError(String buildStepId) {
//     final buildSteps = state.value ?? [];

//     final updatedBuildSteps = buildSteps.map(
//       (buildStep) {
//         if (buildStep.id == buildStepId) {
//           return buildStep.copyWith(
//             error: buildStep.buildStepsError,
//           );
//         }

//         return buildStep;
//       },
//     ).toList();

//     state = AsyncValue.data(updatedBuildSteps);
//   }

//   void updateAddOnQuantity({
//     required String buildStepId,
//     required String addOnId,
//     required AddOnQuantityAction action,
//   }) {
//     final buildSteps = state.value ?? [];

//     final updatedBuildSteps = buildSteps.map(
//       (buildStep) {
//         if (buildStep.id == buildStepId) {
//           return buildStep.copyWith(
//             addOns: buildStep.addOns.map((addOn) {
//               if (addOn.id == addOnId) {
//                 switch (action) {
//                   case AddOnQuantityAction.increment:
//                     return addOn.incrementQuantity();
//                   case AddOnQuantityAction.decrement:
//                     return addOn.decrementQuantity();
//                   case AddOnQuantityAction.toggleIsSelected:
//                     return addOn.toggleIsSelected();
//                 }
//               }

//               return addOn;
//             }).toList(),
//           );
//         }

//         return buildStep;
//       },
//     ).toList();

//     state = AsyncValue.data(updatedBuildSteps);

//     // update build step error and add on is included in price
//     updateBuildStepError(buildStepId);
//     updateAddOnIsIncludedInPrice(buildStepId, addOnId);
//   }

//   void reset() {
//     state = const AsyncValue.data([]);
//   }

//   void setBuildSteps(List<BuildStep> buildSteps) {
//     state = AsyncValue.data(buildSteps);
//   }

//   void setBuildStepsFromFoodItem(FoodItem foodItem) {
//     final buildSteps = getBuildStepFromCategory(foodItem.categoryId);

//     logError('buildSteps: ${buildSteps?.length}');

//     state = AsyncValue.data(buildSteps ?? []);
//   }

//   List<BuildStep>? getBuildStepFromCategory(String categoryId) {
//     final category = ref.read(categoryNotifierProvider).value?.firstWhereOrNull(
//       (e) {
//         logError('Compare: ${e.title.toLowerCase()} == $categoryId');
//         return e.id?.toLowerCase() == categoryId.toLowerCase();
//       },
//     );

//     return category?.buildSteps;
//   }
// }
