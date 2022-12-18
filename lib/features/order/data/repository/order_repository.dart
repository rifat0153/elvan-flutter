import 'package:elvan/features/order/data/dto/order_dto.dart';

abstract class OrderRepository {
  Future createOrder(OrderDto orderDto);

  Future<List<OrderDto>> getOrders(String userId, {int limit});
}
