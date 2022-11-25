import 'package:elvan/features/food/models/food_item/food_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const Cart._();

  @JsonSerializable(explicitToJson: true)
  const factory Cart({
    required String userId,
    @Default([]) List<FoodItem> foodItems,
    required double total,
    required double subTotal,
  }) = _Cart;

  bool get isEmpty => foodItems.isEmpty;

  double getTotalBeforeDiscound() {
    double total = 0;
    for (var foodItem in foodItems) {
      total += foodItem.price;
    }
    return total;
  }

  double getTotalAfterDiscount() {
    double total = 0;
    for (var foodItem in foodItems) {
      total += foodItem.price;
      if (foodItem.discount != null) {
        total -= foodItem.discount!;
      }
    }
    return total;
  }

  void addToCart(FoodItem foodItem) {
    foodItems.add(foodItem);
  }

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
