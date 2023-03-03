import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';

final orderRecordsNotifierProvider =
    AsyncNotifierProvider<OrderRecordsNotifier, List<Order>>(
  () => OrderRecordsNotifier(),
);

class OrderRecordsNotifier extends AsyncNotifier<List<Order>> {
  late final OrderUseCase orderUseCase;

  @override
  FutureOr<List<Order>> build() {
    orderUseCase = ref.read(orderUseCaseProvider);

    return getOrderRecords();
  }

  Future<List<Order>> getOrderRecords() async {
    final userId = ref.read(currentUserIdProvider);

    if (userId == null) {
      throw Exception('User is not logged in');
    }
    final result = await orderUseCase.getRecentOrders(userId, limit: 10);

    return result;
  }

  Future cancleOrder(String orderID) {
    return orderUseCase.cancelOrder(orderID);
  }
}
