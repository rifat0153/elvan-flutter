// import 'package:collection/collection.dart';
// import 'package:elvan_shared/dtos/order/order_status_dto.dart';

// enum OrderStatus {
//   pending('pending'),
//   accepted('accepted'),
//   processing('processing'),
//   done('done'),
//   delivered('delivered'),
//   rejected('rejected'),
//   cancelled('cancelled'),
//   unknown('unknown');

//   const OrderStatus(this.status);
//   final String status;

//   static OrderStatus fromDto(OrderStatusDto status) {
//     final val =
//         OrderStatus.values.firstWhereOrNull((e) => e.status == status.status);
//     return val ?? OrderStatus.unknown;
//   }

//   OrderStatusDto toDto() {
//     return OrderStatusDto.values.firstWhere((e) => e.status == status);
//   }

//   static String toJson(OrderStatus status) {
//     return status.name;
//   }
// }
