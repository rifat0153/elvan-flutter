import 'package:elvan/features/order/domain/models/order_status.dart';
import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:elvan_shared/domain_models/order/order_status.dart';
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

    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      discount: 0,
      items: cart.cartItems,
      status: OrderStatus.pending,
      subTotal: 100,
      total: 100,
      userId: '123',
    );

    await useCase.createOrder(order);
  }
}
