import 'package:elvan_shared/domain_models/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/features/food/data/repository/food_repository_impl.dart';
import 'package:elvan/features/food/domain/repository/food_repository.dart';

final foodUseCaseProvider = Provider<FoodUseCase>((ref) {
  final foodRepository = ref.watch(foodRepositoryProvider);

  return FoodUseCase(foodRepository: foodRepository);
});

class FoodUseCase {
  final FoodRepository foodRepository;

  FoodUseCase({required this.foodRepository});

  Future<Map<String, List<FoodItem>>> getFoodByCategories({
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
          (e) => selectedCategories.isEmpty
              ? true
              : selectedCategories.contains(
                  e.categoryId.toLowerCase().replaceAll(' ', ''),
                ),
        )
        .toList();

    final Map<String, List<FoodItem>> foodCategoryMap = {};
    for (final foodItem in filteredFoodList) {
      if (foodCategoryMap.containsKey(foodItem.categoryId)) {
        foodCategoryMap[foodItem.categoryId]!.add(foodItem);
      } else {
        foodCategoryMap[foodItem.categoryId] = [foodItem];
      }
    }

    return foodCategoryMap;
  }

  Future<List<FoodItem>> getFoodList() async {
    final foodDtos = await foodRepository.getFoodList();

    final foodList = foodDtos
        .map(
          (e) => FoodItem.fromDto(e),
        )
        .toList();

    return foodList;
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
