import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';

final orderProvider = NotifierProvider<OrderNotifier, void>(OrderNotifier.new);

class OrderNotifier extends Notifier<void> {
  @override
  build() {}

  Future createOrderFromCart() async {
    final useCase = ref.read(orderUseCaseProvider);

    final cart = ref.read(cartProvider.notifier).cart;
    if (cart == null) {
      throw Exception('Cart is empty');
    }

    // final order = Order(
    //   id: DateTime.now().millisecondsSinceEpoch.toString(),
    //   cart: cart,
    // );

    // final 

    // await useCase.createOrder(order);
  }
}
