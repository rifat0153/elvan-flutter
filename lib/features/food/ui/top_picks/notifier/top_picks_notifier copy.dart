// import 'package:elvan/core/ui_state/ui_state.dart';
// import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
// import 'package:elvan/features/food/domain/use_case/food_use_case.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// final topPicksNotifierProvider = NotifierProvider<TopPicksNotifier, UiState<List<FoodItem>>>(() {
//   return TopPicksNotifier();
// });

// class TopPicksNotifier extends Notifier<List<FoodItem>> {
//   late final FoodUseCase topPicksUseCase;

//   List<FoodItem>? get topPicks => state.data;

//   @override
//   build() {
//     topPicksUseCase = ref.read(foodUseCaseProvider);

//     getTopPicks();

//     return const UiState.loading();
//   }

//   Future<void> getTopPicks() async {
//     final result = await topPicksUseCase.getTopPicks();

//     if (!state.loading) {
//       state = const UiState.loading();
//     }

//     state = result;
//   }
// }
