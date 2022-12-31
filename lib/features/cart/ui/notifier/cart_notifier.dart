import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/cart/domain/models/cart/cart.dart';
import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
import 'package:elvan/features/cart/domain/use_case/cart_item_use_case.dart';
import 'package:elvan/features/cart/ui/notifier/cart_update_notifier.dart';
import 'package:elvan/features/cart/ui/state/cart_ui_state.dart';
import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';
import 'package:elvan/shared/providers/scaffold_messenger/snackbar_provider.dart';

final cartNotifierProvider = NotifierProvider<CartNotifier, CartUiState>(
  CartNotifier.new,
);

class CartNotifier extends Notifier<CartUiState> {
  @override
  CartUiState build() {
    return const CartUiState.empty();
  }

  bool get hasData => state.value != null;

  String getUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  void handleAddToCart() {
    final foodItem = ref.read(selectedFoodItemNotifierProvider).value;
    final buildSteps = ref.read(buildStepsNotifierProvider).value;

    if (foodItem == null) {
      state = const CartUiState.error('Please select a food item');
      return;
    }
    if (buildSteps == null) {
      state = const CartUiState.error('Please select build steps');
      return;
    }

    final isCartUpdateState = ref.read(cartUpdateProvider);

    final cartItem = CartItem(
      id: getUniqueId(),
      foodItem: foodItem,
      buildSteps: buildSteps,
      price: getTotalPrice(foodItem, buildSteps),
      quantity: 1,
    );

    if (isCartUpdateState == CartUpdateNotifierState.updating) {
      updateCart(cartItem);
    } else {
      addToCart(cartItem);
    }
  }

  void addToCart(CartItem cartItem) {
    if (!hasData) {
      state = CartUiState.data(
        Cart(
          userId: ref.read(currentUserIdProvider)!,
          cartItems: [cartItem],
        ),
      );
    } else {
      final cartItemUseCase = ref.read(cartItemListUseCaseProvider);

      final cartItems = cartItemUseCase.addToCart(
        state.value?.cartItems ?? [],
        cartItem,
      );

      state = CartUiState.data(
        state.value!.copyWith(
          cartItems: cartItems,
        ),
      );
    }

    logError('Added to cart ${cartItem.foodItem.title}');

    ref.read(snackbarNotifierProvider.notifier).showSnackbarWithAction(
          'Added to cart',
          actionLabel: 'Undo',
          onAction: () => removeFromCart(cartItem),
        );
  }

  void updateCart(CartItem cartItem) {
    if (!hasData) {
      addToCart(cartItem);
      return;
    }

    final cartItemListUseCase = ref.read(cartItemListUseCaseProvider);
    final updatingCartItem = ref.read(cartUpdateProvider.notifier).updatingCartItem;

    if (updatingCartItem == null) {
      state = const CartUiState.error('Cart item id is null');
      return;
    }

    final updatedCartItems = cartItemListUseCase.updateCartItem(
      state.value?.cartItems ?? [],
      updatingCartItem.copyWith(
        foodItem: cartItem.foodItem,
        buildSteps: cartItem.buildSteps,
      ),
    );

    // reset updating cart item
    ref.read(cartUpdateProvider.notifier).reset();

    state = CartUiState.data(
      state.value!.copyWith(
        cartItems: updatedCartItems,
      ),
    );
  }

  void removeFromCart(CartItem cartItem) {
    if (!hasData) {
      state = const CartUiState.error('Cart is empty');
      return;
    }

    final cartItemListUseCase = ref.read(cartItemListUseCaseProvider);

    final updatedCartItems = cartItemListUseCase.removeFromCart(
      state.value?.cartItems ?? [],
      cartItem,
    );

    state = CartUiState.data(
      state.value!.copyWith(
        cartItems: updatedCartItems,
      ),
    );
  }

  double getTotalPrice(FoodItem foodItem, List<BuildStep> buildSteps) {
    final bsPrice = buildSteps.fold<double>(
      0,
      (previousValue, element) => previousValue + element.price,
    );

    return foodItem.price + bsPrice;
  }

  void resetCart() {
    state = const CartUiState.empty();
  }
}