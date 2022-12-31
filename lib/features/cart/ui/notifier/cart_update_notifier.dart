import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum CartUpdateNotifierState { initial, updating, cancelled }

final cartUpdateProvider = NotifierProvider<CartUpdateNotifier, CartUpdateNotifierState>(
  CartUpdateNotifier.new,
);

class CartUpdateNotifier extends Notifier<CartUpdateNotifierState> {
  CartItem? updatingCartItem;

  @override
  build() {
    return CartUpdateNotifierState.initial;
  }

  void reset() {
    updatingCartItem = null;
    state = CartUpdateNotifierState.initial;
  }

  void setUpdatingCartItem(CartItem cartItem) {
    updatingCartItem = cartItem;
  }

  void startUpdating() {
    state = CartUpdateNotifierState.updating;
  }
}
