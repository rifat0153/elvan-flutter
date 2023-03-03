import 'package:elvan_shared/dtos/food/food_item_dto.dart';

abstract class FoodRepository {
  Stream<List<FoodItemDto>> getFoodsStream();

  Future<List<FoodItemDto>> getFoodList();

  Future<List<FoodItemDto>> getTopPicks();
}
