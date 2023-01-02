import 'package:elvan/features/order/data/dto/order_dto.dart';

abstract class OrderRepository {
  Future createOrder(OrderDto orderDto);

  Stream<OrderDto> getOrderStream(String userId);

  Future<List<OrderDto>> getOrders(String userId, {int limit});
}
