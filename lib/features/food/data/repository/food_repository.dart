import 'package:elvan/features/food/data/dto/food_item_dto.dart';

abstract class FoodRepository {
  Stream<List<FoodItemDto>> getFoodsStream();
}