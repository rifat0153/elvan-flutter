// import 'package:collection/collection.dart';

// enum OrderStatusDto {
//   pending('pending'),
//   accepted('accepted'),
//   processing('processing'),
//   done('done'),
//   delivered('delivered'),
//   rejected('rejected'),
//   cancelled('cancelled'),
//   unknown('unknown');

//   const OrderStatusDto(this.status);
//   final String status;

//   static OrderStatusDto fromJson(String status) {
//     final val = OrderStatusDto.values.firstWhereOrNull((e) => e.status == status);
//     return val ?? OrderStatusDto.unknown;
//   }

//   static String toJson(OrderStatusDto status) {
//     return status.name;
//   }
// }
