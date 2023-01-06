import 'package:elvan_shared/domain_models/cart/cart_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// create provider
final cartItemListUseCaseProvider = Provider<CartItemListUseCase>(
  (ref) => CartItemListUseCase(),
);

class CartItemListUseCase {
  List<CartItem> updateCartItem(
    List<CartItem> cartItems,
    CartItem cartItem,
  ) {
    final updatedCartItems = cartItems.map((item) {
      if (item.id == cartItem.id) {
        return cartItem;
      }
      return item;
    }).toList();

    return updatedCartItems;
  }

  List<CartItem> addToCart(
    List<CartItem>? cartItems,
    CartItem cartItem,
  ) {
    if (cartItems == null) {
      return [cartItem];
    }

    return [...cartItems, cartItem];
  }

  List<CartItem> removeFromCart(
    List<CartItem> cartItems,
    CartItem cartItem,
  ) {
    final updatedCartItems = cartItems.where((item) => item.id != cartItem.id);

    return updatedCartItems.toList();
  }

  List<CartItem> resetCart() {
    return [];
  }

  List<CartItem> updateCartQuantity(
    List<CartItem> cartItems,
    String cartItemId,
    int quantity,
  ) {
    final updatedCartItems = cartItems.map((item) {
      if (item.id == cartItemId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();

    return updatedCartItems;
  }
}
