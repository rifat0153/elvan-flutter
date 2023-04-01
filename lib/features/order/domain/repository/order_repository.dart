import 'package:elvan_shared/dtos/order/order_dto.dart';

abstract class OrderRepository {
  Future createOrder(OrderDto orderDto);

  Stream<OrderDto> getOrderStream(String userId);

  Future<List<OrderDto>> getOrders(String userId, {int limit});

  Future cancelOrder(String orderId);

  Stream<OrderDto> getSingleOrderStream(String orderID);

  Future<OrderDto> getSingleOrder(String orderId);

  Stream<List<OrderDto>> getOrdersStream(String userID);

  //check if order is in progress
  Future<bool> isOrderInProgress(String userId);

  //get if we are taking order or not
  Stream<bool> isTakingOrder();
}
