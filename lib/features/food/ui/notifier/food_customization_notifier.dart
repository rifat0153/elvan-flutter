import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/features/order/domain/models/food_item_customized.dart';

part 'food_customization_notifier.g.dart';

@riverpod
class FoodCustomizationNotifier extends _$FoodCustomizationNotifier {
  @override
  FutureOr<FoodItemCustomized?> build() {
    return null;
  }

  void setFoodItemCustomized(FoodItem foodItem) {
    final buildSteps = getBuildStepFromCategory(foodItem.category);

    final foodItemCustomized = FoodItemCustomized.fromFoodAndBuildInfo(foodItem, buildSteps ?? []);

    state = AsyncValue.data(foodItemCustomized);
  }

  List<BuildStep>? getBuildStepFromCategory(String categoryTitle) {
    final category = ref.read(categoryNotifierProvider).value?.firstWhereOrNull(
          (e) => e.title.toLowerCase() == categoryTitle.toLowerCase(),
        );

    return category?.buildSteps;
  }
}
