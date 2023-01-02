import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/core/firebase/firebase_providers.dart';
import 'package:elvan/features/order/data/dto/order_dto.dart';

import '../../domain/repository/order_repository.dart';

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
  Stream<OrderDto> getOrderStream(String orderId) {
    return firebaseFirestore.collection('orders').doc(orderId).snapshots().map(
          (event) => OrderDto.fromJson(
            event.data()!,
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
        .get();

    final orderDtos = orders.docs.map((e) => OrderDto.fromJson(e.data())).toList();

    return orderDtos;
  }
}
