import 'package:elvan/features/order/ui/recent_order/notifier/recent_order_notifier.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecentOrdersWidget extends HookConsumerWidget {
  const RecentOrdersWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentOrderNotifier = ref.watch(recentOrderNotifierProvider);

    return recentOrderNotifier.when(
      data: (list) => Center(
        child: AppText(list.length.toString()),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e) => Center(child: Text(e!)),
    );
  }
}
