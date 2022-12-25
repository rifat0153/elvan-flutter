import 'package:elvan/core/failure/failure.dart';
import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/order/domain/repository/order_repository.dart';
import 'package:elvan/features/order/data/repository/order_repository_impl.dart';
import 'package:elvan/features/order/domain/models/order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderUseCaseProvider = Provider<OrderUseCase>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);

  return OrderUseCase(orderRepository);
});

class OrderUseCase {
  final OrderRepository _orderRepository;

  OrderUseCase(this._orderRepository);

  Future<Result<List<Order>>> getRecentOrders(String userId, {limit = 10}) async {
    print('Get recent orders for user: $userId');

    try {
      final orderDtos = await _orderRepository.getOrders(userId, limit: limit);
      final orders = orderDtos.map((e) => Order.fromDto(e)).toList();

      return Result.success(orders);
    } on Exception catch (e) {
      return Result.failure(Failure(message: e.toString()));
    }
  }
}
