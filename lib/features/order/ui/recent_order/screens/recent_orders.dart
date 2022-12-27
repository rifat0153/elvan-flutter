import 'package:elvan/features/order/ui/recent_order/notifier/recent_order_notifier.dart';
import 'package:elvan/features/order/ui/recent_order/screens/recent_order_grid.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecentOrdersWidget extends HookConsumerWidget {
  const RecentOrdersWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentOrderNotifier = ref.watch(recentOrderNotifierProvider);

    return recentOrderNotifier.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (cartItems) => RecentOrdersGrid(cartItems: cartItems),
      error: (e, st) => Center(child: Text(e!)),
    );
  }
}
