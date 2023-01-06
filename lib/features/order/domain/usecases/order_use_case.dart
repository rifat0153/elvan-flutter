import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/order/data/repository/order_repository_impl.dart';
import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/domain/repository/order_repository.dart';

final orderUseCaseProvider = Provider<OrderUseCase>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);

  return OrderUseCase(orderRepository);
});

class OrderUseCase {
  final OrderRepository _orderRepository;

  OrderUseCase(this._orderRepository);

  Stream<Order> getOrderStream(String userId) {
    return _orderRepository.getOrderStream(userId).map((e) => Order.fromDto(e));
  }

  Future createOrder(Order order) async {
    final orderDto = order.toDto();

    await _orderRepository.createOrder(orderDto);
  }

  Future<List<Order>> getRecentOrders(String userId, {limit = 10}) async {
    final orderDtos = await _orderRepository.getOrders(userId, limit: limit);
    final orders = orderDtos.map((e) => Order.fromDto(e)).toList();

    return orders;
  }
}
