import 'package:elvan/core/ui_state/ui_state.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/domain/use_cases/top_picks_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final topPicksNotifierProvider = NotifierProvider<TopPicksNotifier, UiState<List<FoodItem>>>(() {
  return TopPicksNotifier();
});

class TopPicksNotifier extends Notifier<UiState<List<FoodItem>>> {
  late final TopPicksUseCase topPicksUseCase;

  List<FoodItem>? get topPicks => state.data;

  @override
  build() {
    topPicksUseCase = ref.read(getTopPicksUseCaseProvider);

    getTopPicks();

    return const UiState.loading();
  }

  Future<void> getTopPicks() async {
    final result = await topPicksUseCase.getTopPicks();

    if (!state.loading) {
      state = const UiState.loading();
    }

    result.when(
      success: (list) => state = UiState.data(list),
      failure: (e) => state = UiState.error(e.message),
    );
  }
}
