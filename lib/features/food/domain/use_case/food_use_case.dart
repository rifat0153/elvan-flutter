import 'package:elvan/features/food/domain/repository/food_repository.dart';
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

  Future<Map<String, List<FoodItem>>> getFoodCategoryMap({
    List<String> selectedCategories = const [],
  }) async {
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

    final foodCategoryMap = <String, List<FoodItem>>{};
    for (final foodItem in filteredFoodList) {
      if (foodCategoryMap.containsKey(foodItem.category)) {
        foodCategoryMap[foodItem.category]!.add(foodItem);
      } else {
        foodCategoryMap[foodItem.category!] = [foodItem];
      }
    }

    return foodCategoryMap;
  }

  Future<List<FoodItem>> getFoodList({
    List<String> selectedCategories = const [],
  }) async {
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

    return filteredFoodList;
  }

  Future<List<FoodItem>> getTopPicks() async {
    final topPickDtos = await foodRepository.getTopPicks();

    final topPicks = topPickDtos
        .map(
          (e) => FoodItem.fromDto(e),
        )
        .toList();

    return topPicks;
  }
}
