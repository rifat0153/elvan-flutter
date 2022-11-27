import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/cart/models/cart_item/cart_item.dart';
import 'package:elvan/features/food/models/food_item/food_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

final cartProvider = Provider<Cart?>((ref) {
  final user = ref.read(currentUserProvider);

  if (user == null) {
    return null;
  }

  return Cart(userId: user.uid);
});

final cartStateProvider = Provider<CartState>((ref) {
  final cart = ref.watch(cartProvider);

  if (cart == null) {
    return const CartState.empty();
  }

  return CartState.notEmpty(cart);
});

@freezed
class CartState with _$CartState {
  const factory CartState.empty() = _CartState_Empty;
  const factory CartState.notEmpty(Cart cart) = _CartState_NotEmpty;
  const factory CartState.error([String? msg]) = _CartState_Error;
}

@freezed
class Cart with _$Cart {
  const Cart._();

  @JsonSerializable(explicitToJson: true)
  const factory Cart({
    required String userId,
    @Default([]) List<CartItem> cartItems,
    @Default(0) double total,
    @Default(0) double subTotal,
  }) = _Cart;

  bool get isEmpty => cartItems.isEmpty;

  double getTotalBeforeDiscount() {
    double total = 0;
    for (var cartItem in cartItems) {
      total += cartItem.price;
    }
    return total;
  }

  double getTotalAfterDiscount() {
    double total = 0;
    for (var foodItem in cartItems) {
      total += foodItem.price;
      if (foodItem.discount != null) {
        total -= foodItem.discount!;
      }
    }
    return total;
  }

  void addToCart(CartItem cartItem) {
    cartItems.add(cartItem);
  }

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}



// @freezed
// class Cart with _$Cart {
//   const Cart._();

//   @JsonSerializable(explicitToJson: true)
//   const factory Cart({
//     required String userId,
//     @Default([]) List<FoodItem> foodItems,
//     @Default(0) double total,
//     @Default(0) double subTotal,
//   }) = _Cart;

//   bool get isEmpty => foodItems.isEmpty;

//   double getTotalBeforeDiscount() {
//     double total = 0;
//     for (var foodItem in foodItems) {
//       total += foodItem.price;
//     }
//     return total;
//   }

//   double getTotalAfterDiscount() {
//     double total = 0;
//     for (var foodItem in foodItems) {
//       total += foodItem.price;
//       if (foodItem.discount != null) {
//         total -= foodItem.discount!;
//       }
//     }
//     return total;
//   }

//   void addToCart(FoodItem foodItem) {
//     foodItems.add(foodItem);
//   }

//   factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
// }
