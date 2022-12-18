import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/features/order/data/dto/order_dto.dart';

import 'order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final FirebaseFirestore firebaseFirestore;

  OrderRepositoryImpl(this.firebaseFirestore);

  @override
  Future createOrder(OrderDto orderDto) {
    return firebaseFirestore
        .collection('orders')
        .doc(orderDto.id)
        .set(
          orderDto.toJson(),
        )
        .then((value) => true)
        .catchError((error) => throw error);
  }

  @override
  Future<List<OrderDto>> getOrders(String userId, {int limit = 10}) {
    return firebaseFirestore
        .collection('orders')
        .where(
          'userId',
          isEqualTo: userId,
        )
        .get()
        .then(
          (value) => value.docs
              .map(
                (e) => OrderDto.fromJson(e.data()),
              )
              .toList(),
        );
  }
}
