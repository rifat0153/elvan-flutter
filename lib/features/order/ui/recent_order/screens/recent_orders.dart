import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/order/ui/recent_order/notifier/recent_order_notifier.dart';
import 'package:elvan/features/order/ui/recent_order/screens/recent_order_grid.dart';

class RecentOrdersWidget extends HookConsumerWidget {
  const RecentOrdersWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentOrderNotifier = ref.watch(recentOrderNotifierProvider);

    final _ = ref.watch(currentUserProvider);

    return recentOrderNotifier.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (cartItems) => RecentOrdersRow(cartItems: cartItems),
      error: (e, st) => Center(
        child: Text(e.toString()),
      ),
    );
  }
}
