import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/domain/use_case/food_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_picks_notifier.g.dart';

@riverpod
FutureOr<List<FoodItem>> topPicks(TopPicksRef ref) {
  final foodUseCase = ref.read(foodUseCaseProvider);

  return foodUseCase.getTopPicks();
}
