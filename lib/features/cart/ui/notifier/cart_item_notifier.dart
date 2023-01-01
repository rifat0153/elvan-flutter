import 'package:hooks_riverpod/hooks_riverpod.dart';

final cartItemProvider = NotifierProvider<CartItemNotifier, void>(() {
  return CartItemNotifier();
});

class CartItemNotifier extends Notifier<void> {
  @override
  build() {
    return;
  }
}
