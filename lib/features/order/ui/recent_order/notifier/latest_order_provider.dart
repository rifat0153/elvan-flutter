import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';

final currentOrderProvider = StreamProvider<Order>((ref) async* {
  final useCase = ref.read(orderUseCaseProvider);
  final userId = ref.read(currentUserIdProvider);

  if (userId == null) {
    throw Exception('User is not logged in');
  }

  final order = useCase.getOrderStream(userId);

  yield* order;
});
