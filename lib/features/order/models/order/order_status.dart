import 'package:collection/collection.dart';

enum OrderStatus {
  pending('pending'),
  accepted('accepted'),
  processing('processing'),
  done('done'),
  delivered('delivered'),
  rejected('rejected'),
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
