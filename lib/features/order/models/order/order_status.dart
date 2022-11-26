import 'package:collection/collection.dart';

enum OrderStatus {
  pending('pending'),
  accepted('accepted'),
  rejected('rejected'),
  delivered('delivered'),
  cancelled('cancelled'),
  unknown('unknown');

  const OrderStatus(this.status);
  final String status;

  static OrderStatus fromJson(String status) {
    final val = OrderStatus.values.firstWhereOrNull((e) => e.status == status);
    return val ?? OrderStatus.unknown;
  }

  static String toJson(OrderStatus status) {
    return status.name;
  }
}
