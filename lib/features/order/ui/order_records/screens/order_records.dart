import 'package:elvan/features/order/ui/components/order_records_app_bar.dart';
import 'package:elvan/features/order/ui/order_records/notifier/order_records_notifier.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrdersRecordsScreen extends HookConsumerWidget {
  const OrdersRecordsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRecordsNotifier = ref.watch(orderRecordsNotifierProvider);

    return orderRecordsNotifier.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (orders) => Scaffold(
        appBar: const OrderRecordsAppBar(),
        body: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            return Text('Order: ${orders[index].id} ');
          },
        ),
      ),
      error: (e, st) => Center(
        child: Text(e.toString()),
      ),
    );
  }
}
