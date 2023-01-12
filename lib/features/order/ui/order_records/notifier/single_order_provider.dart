import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';

final singleOrderProvider =
    StreamProvider.family<Order, String>((ref, orderID) async* {
  final useCase = ref.read(orderUseCaseProvider);

  final order =
      useCase.getSingleOrderStream(orderID).map((e) => Order.fromDto(e));

  yield* order;
});
