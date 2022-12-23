import 'package:elvan/features/cart/data/dto/cart_dto.dart';
import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

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

  factory Cart.fromDto(CartDto cartDto) {
    return Cart(
      userId: cartDto.userId,
      cartItems: cartDto.cartItems.map((e) => CartItem.fromDto(e)).toList(),
      total: cartDto.total,
      subTotal: cartDto.subTotal,
    );
  }
}