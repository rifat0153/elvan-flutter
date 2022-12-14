import 'package:elvan/core/failure/failure.dart';
import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/food/data/repository/food_repository.dart';
import 'package:elvan/features/food/data/repository/food_repository_impl.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getTopPicksUseCaseProvider = Provider<TopPicksUseCase>((ref) {
  final foodRepository = ref.watch(foodRepositoryProvider);

  return TopPicksUseCase(foodRepository: foodRepository);
});

class TopPicksUseCase {
  final FoodRepository foodRepository;

  TopPicksUseCase({required this.foodRepository});

  Future<Result<List<FoodItem>>> getTopPicks() async {
    try {
      final topPickDtos = await foodRepository.getTopPicks();

      final topPicks = topPickDtos
          .map(
            (e) => FoodItem.fromDto(e),
          )
          .toList();

      return Result.success(topPicks);
    } catch (e) {
      return Result.failure(Failure(message: e.toString(), error: e));
    }
  }
}
