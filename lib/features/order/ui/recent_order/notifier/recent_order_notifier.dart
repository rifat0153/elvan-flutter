import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/ui_state/ui_state.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';

final recentOrderNotifierProvider = AsyncNotifierProvider<RecentOrderNotifier, List<CartItem>>(
  () => RecentOrderNotifier(),
);

class RecentOrderNotifier extends AsyncNotifier<List<CartItem>> {
  late final OrderUseCase orderUseCase;

  @override
  FutureOr<List<CartItem>> build() {
    orderUseCase = ref.read(orderUseCaseProvider);

    return getRecentOrders();
  }

  Future<List<CartItem>> getRecentOrders() async {
    final userId = ref.read(currentUserIdProvider);

    if (userId == null) {
      throw Exception('User is not logged in');
    }

    final result = await orderUseCase.getRecentOrders(userId, limit: 10);

    final cartItems = <CartItem>[];

    for (final order in result) {
      cartItems.addAll(order.items);
    }

    return cartItems;
  }
}
