import 'package:elvan_shared/domain_models/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';

enum CartUpdateNotifierState { initial, updating, cancelled }

final cartItemUpdateProvider =
    NotifierProvider<CartItemUpdateNotifier, CartUpdateNotifierState>(
  CartItemUpdateNotifier.new,
);

class CartItemUpdateNotifier extends Notifier<CartUpdateNotifierState> {
  CartItem? updatingCartItem;

  @override
  build() {
    return CartUpdateNotifierState.initial;
  }

  bool get isUpdating => state == CartUpdateNotifierState.updating;

  void reset() {
    updatingCartItem = null;
    state = CartUpdateNotifierState.initial;
  }

  void setUpdatingCartItem(CartItem cartItem) {
    updatingCartItem = cartItem;

    // update selected food item
    ref
        .read(selectedFoodItemNotifierProvider.notifier)
        .setFoodItem(cartItem.foodItem);
    // update build steps
    ref
        .read(buildStepsNotifierProvider.notifier)
        .setBuildSteps(cartItem.buildSteps);

    state = CartUpdateNotifierState.updating;
  }

  void startUpdating() {
    state = CartUpdateNotifierState.updating;
  }
}
