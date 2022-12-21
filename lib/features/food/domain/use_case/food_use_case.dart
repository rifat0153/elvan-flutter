import 'package:elvan/core/failure/failure.dart';
import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/food/data/repository/food_repository.dart';
import 'package:elvan/features/food/data/repository/food_repository_impl.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final foodUseCaseProvider = Provider<FoodUseCase>((ref) {
  final foodRepository = ref.watch(foodRepositoryProvider);

  return FoodUseCase(foodRepository: foodRepository);
});

class FoodUseCase {
  final FoodRepository foodRepository;

  FoodUseCase({required this.foodRepository});

  Future<Result<List<FoodItem>>> getFoodList({
    List<String> selectedCategories = const [],
  }) async {
    try {
      final foodDtos = await foodRepository.getFoodList();

      final foodList = foodDtos
          .map(
            (e) => FoodItem.fromDto(e),
          )
          .toList();

      final filteredFoodList = foodList
          .where(
            (e) => selectedCategories.isEmpty ? true : selectedCategories.contains(e.category),
          )
          .toList();

      return Result.success(filteredFoodList);
    } catch (e) {
      return Result.failure(Failure(message: e.toString(), error: e));
    }
  }

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
