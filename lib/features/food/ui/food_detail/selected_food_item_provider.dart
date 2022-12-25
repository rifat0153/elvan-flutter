import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_food_item_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedFoodItem extends _$SelectedFoodItem {
  @override
  FoodItem? build() {
    return null;
  }

  setFoodItem(FoodItem foodItem) {
    state = foodItem;
  }
}
