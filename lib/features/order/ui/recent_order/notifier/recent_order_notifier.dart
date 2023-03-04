import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';
import 'package:elvan_shared/domain_models/index.dart';

final recentOrderNotifierProvider = FutureProvider<List<CartItem>>((ref) async {
  final orderUseCase = ref.read(orderUseCaseProvider);
  final userId = ref.watch(currentUserIdProvider);

  logInfo('getRecentOrders: userId: $userId');

  if (userId == null) {
    throw Exception('User is not logged in');
  }

  final result = await orderUseCase.getRecentOrders(userId, limit: 4);
  final cartItems = result.expand((order) => order.items).toList();

  return cartItems;
});


//* same as above but using AsyncNotifierProvider

// final recentOrderNotifierProvider = AsyncNotifierProvider.autoDispose<RecentOrderNotifier, List<CartItem>>(
//   () => RecentOrderNotifier(),
// );

// class RecentOrderNotifier extends AutoDisposeAsyncNotifier<List<CartItem>> {
//   @override
//   FutureOr<List<CartItem>> build() async {
//     final orderUseCase = ref.read(orderUseCaseProvider);
//     final userId = ref.watch(currentUserIdProvider);

//     logInfo('getRecentOrders: userId: $userId');

//     if (userId == null) {
//       throw Exception('User is not logged in');
//     }

//     final result = await orderUseCase.getRecentOrders(userId, limit: 4);
//     final cartItems = result.expand((order) => order.items).toList();

//     return cartItems;
//   }
// }
