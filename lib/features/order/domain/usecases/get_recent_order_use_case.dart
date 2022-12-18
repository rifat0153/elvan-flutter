import 'package:elvan/features/order/data/repository/order_repository.dart';
import 'package:elvan/features/order/domain/models/order.dart';

class GetRecentOrderUseCase {
  final OrderRepository _orderRepository;

  GetRecentOrderUseCase(this._orderRepository);

  Future<List<Order>> call() async {
    final orderDtos = await _orderRepository.getOrders('1');

    return orderDtos.map((e) => Order.fromDto(e)).toList();
  }
}
