import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/features/order/data/repository/order_repository_impl.dart';
import 'package:elvan/features/order/domain/repository/order_repository.dart';

final orderUseCaseProvider = Provider<OrderUseCase>((ref) {
  final orderRepository = ref.watch(orderRepositoryProvider);

  return OrderUseCase(orderRepository);
});

final isTakingOrderProvider = StreamProvider<bool>((ref) async* {
  final useCase = ref.read(orderUseCaseProvider);
  // final userId = ref.read(currentUserIdProvider);

  final order = useCase.isTakingOrder();

  yield* order;
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

  Future<Order> getSingleOrder(String orderId) async {
    final orderDto = await _orderRepository.getSingleOrder(orderId);
    return Order.fromDto(orderDto);
  }

  Future cancelOrder(String orderId) async {
    await _orderRepository.cancelOrder(orderId);
  }

  Stream<Order> getSingleOrderStream(String orderId) {
    return _orderRepository.getSingleOrderStream(orderId).map((e) => Order.fromDto(e));
  }

  Stream<List<Order>> getOrdersStream(String userID) {
    return _orderRepository.getOrdersStream(userID).map((e) => e.map((e) => Order.fromDto(e)).toList());
  }

  Future<List<Order>> getRecentOrders(String userId, {int limit = 10}) async {
    final orderDtos = await _orderRepository.getOrders(userId, limit: limit);
    final orders = orderDtos.map((e) => Order.fromDto(e)).toList();
    return orders;
  }

  //check if order is in progress
  Future<bool> isOrderInProgress(String userId) async {
    return _orderRepository.isOrderInProgress(userId);
  }

  //get if we are taking order or not
  Stream<bool> isTakingOrder() {
    return _orderRepository.isTakingOrder();
  }
}
