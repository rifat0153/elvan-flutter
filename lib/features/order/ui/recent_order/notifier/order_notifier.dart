import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:elvan/features/auth/providers/auth_providers.dart';
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

  Future<String> createOrderFromCart() async {
    final useCase = ref.read(orderUseCaseProvider);

    final cart = ref.read(cartProvider.notifier).cart;
    if (cart == null) {
      throw Exception('Cart is empty');
    }

    final userId = ref.read(currentUserIdProvider);

    if (userId == null) {
      throw Exception('User is not logged in');
    }

    final order = Order(
      createdAt: fs.Timestamp.fromDate(DateTime.now()),
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      discount: 0,
      items: cart.cartItems,
      status: OrderStatus.pending,
      subTotal: cart.cartItems.fold(
        0,
        (previousValue, element) => previousValue + element.price,
      ),
      total: cart.total,
      userId: userId,
    );

    await useCase.createOrder(order);
    //clear cart
    ref.read(cartProvider.notifier).resetCart();

    return order.id;
  }
}
