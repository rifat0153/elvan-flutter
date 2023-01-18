import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan_shared/domain_models/order/order_status.dart';
import 'package:elvan_shared/dtos/order/order_dto.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/core/firebase/firebase_providers.dart';
import 'package:elvan/features/order/data/dto/order_dto.dart';
import 'package:elvan/features/order/domain/repository/order_repository.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final firebaseFirestore = ref.watch(firebaseFirestoreProvider);

  return OrderRepositoryImpl(firebaseFirestore);
});

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
  Stream<OrderDto> getOrderStream(String userId) {
    return firebaseFirestore
        .collection('orders')
        .where(
          'userId',
          isEqualTo: userId,
        )
        .orderBy(
          'createdAt',
          descending: true,
        )
        .limit(1)
        .snapshots()
        .map(
          (event) => OrderDto.fromJson(
            event.docs.first.data(),
          ),
        );
  }

  @override
  Future<List<OrderDto>> getOrders(String userId, {int limit = 10}) async {
    final orders = await firebaseFirestore
        .collection('orders')
        .where(
          'userId',
          isEqualTo: userId,
        )
        .limit(limit)
        .get();

    final orderDtos =
        orders.docs.map((e) => OrderDto.fromJson(e.data())).toList();

    return orderDtos;
  }

  @override
  Future cancelOrder(String orderId) {
    return firebaseFirestore
        .collection('orders')
        .doc(orderId)
        .update(
          {
            'status': OrderStatus.cancelled.status,
          },
        )
        .then((value) => true)
        .catchError((error) => throw error);
  }

  @override
  Stream<OrderDto> getSingleOrderStream(String orderID) {
    return firebaseFirestore.collection('orders').doc(orderID).snapshots().map(
          (event) => OrderDto.fromJson(
            event.data()!,
          ),
        );
  }

  @override
  Future<OrderDto> getSingleOrder(String orderId) {
    return firebaseFirestore
        .collection('orders')
        .doc(orderId)
        .get()
        .then(
          (value) => OrderDto.fromJson(
            value.data()!,
          ),
        )
        .catchError((error) => throw error);
  }

  @override
  Stream<List<OrderDto>> getOrdersStream(String userID) {
    return firebaseFirestore
        .collection('orders')
        .where(
          'userId',
          isEqualTo: userID,
        )
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => OrderDto.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }
}
