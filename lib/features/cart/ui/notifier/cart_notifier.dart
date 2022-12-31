import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/cart/domain/models/cart/cart.dart';
import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
import 'package:elvan/features/cart/ui/state/cart_ui_state.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';

final cartNotifierProvider = NotifierProvider<CartNotifier, CartUiState>(
  CartNotifier.new,
);

class CartNotifier extends Notifier<CartUiState> {
  @override
  CartUiState build() {
    return const CartUiState.empty();
  }

  String getUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  void addToCart(
    FoodItem foodItem,
  ) {
    final buildSteps = ref.read(buildStepsNotifierProvider).value;
    if (buildSteps == null) {
      state = const CartUiState.error('Please select build steps');
      return;
    }

    final price = buildSteps.fold<double>(
      0,
      (previousValue, element) => previousValue + element.price,
    );

    final totalPrice = foodItem.price + price;

    final cartItem = CartItem(
      id: getUniqueId(),
      foodItem: foodItem,
      buildSteps: buildSteps,
      price: totalPrice,
      quantity: 1,
    );

    updateCart(cartItem);
  }

  void updateCartItemQuantity(String cartItemId, int quantity) {
    final cart = state.value;
    final cartItems = cart?.cartItems;

    if (cartItems == null) {
      state = const CartUiState.error('Cart is empty');
      return;
    }

    final updatedCartItems = cartItems.map((cartItem) {
      if (cartItem.id == cartItemId) {
        return cartItem.copyWith(quantity: quantity);
      }
      return cartItem;
    }).toList();

    state = CartUiState.data(
      cart!.copyWith(
        cartItems: updatedCartItems,
      ),
    );
  }

  void updateCart(CartItem cartItem) {
    final cart = state.value;
    final cartItems = cart?.cartItems;

    final userId = ref.read(currentUserIdProvider);

    if (userId == null) {
      state = const CartUiState.error('Please log in to add items to cart');
      return;
    }

    // If cart is empty, create a new cart
    if (cart == null) {
      state = CartUiState.data(
        Cart(
          userId: '1',
          cartItems: [cartItem],
        ),
      );
      return;
    }

    // If cart is not empty, add the cartItem to the cart and update the state
    state = CartUiState.data(
      cart.copyWith(
        cartItems: [...?cartItems, cartItem],
      ),
    );
  }

  void resetCart() {
    state = const CartUiState.empty();
  }
}
