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

// @Riverpod(keepAlive: true)
// class SelectedFoodId extends _$SelectedFoodId {
//   @override
//   String build() {
//     return '0';
//   }

//   setId(String id) {
//     state = id;
//   }
// }
