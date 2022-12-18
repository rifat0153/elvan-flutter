import 'package:elvan/core/ui_state/ui_state.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final recentOrderNotifierProvider = NotifierProvider<RecentOrderNotifier, UiState<List<Order>>>(
  () => RecentOrderNotifier(),
);

class RecentOrderNotifier extends Notifier<UiState<List<Order>>> {
  late final OrderUseCase orderUseCase;

  @override
  build() {
    orderUseCase = ref.read(orderUseCaseProvider);

    getRecentOrders();

    return const UiState.loading();
  }

  Future getRecentOrders() async {
    state = const UiState.loading();

    final userId = ref.read(currentUserIdProvider);

    if (userId == null) {
      state = const UiState.error('User not found');
      return;
    }

    debugPrint('userId: $userId');

    final result = await orderUseCase.getRecentOrders(userId, limit: 10);

    result.when(
      success: (list) => state = UiState.data(list),
      failure: (e) => state = UiState.error(e.message),
    );
  }
}
