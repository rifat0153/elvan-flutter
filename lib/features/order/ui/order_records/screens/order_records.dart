import 'package:elvan/features/order/ui/components/order_records_app_bar.dart';
import 'package:elvan/features/order/ui/order_records/notifier/order_records_notifier.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrdersRecordsScreen extends HookConsumerWidget {
  const OrdersRecordsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRecordsNotifier = ref.watch(orderRecordsNotifierProvider);

    return orderRecordsNotifier.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (orders) => ElvanScaffold(
        imagePath: AppAsset.homeBackgroundPng,
        appBar: const OrderRecordsAppBar(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.paddingMD),
              child: AppText(
                'Your last orders',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                var order = orders[index];
                return ListTile(
                  tileColor: Colors.grey,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var item in order.items)
                        AppText(
                          '${item.foodItem.title} x${item.quantity}',
                          style: item == order.items.first
                              ? Theme.of(context).textTheme.headline4
                              : Theme.of(context).textTheme.bodyText1,
                        ),
                    ],
                  ),

                  // AppText('${order.items.length} items'),
                  trailing: AppText("\$${order.total}"),
                );
              },
            ),
          ],
        ),
      ),
      error: (e, st) => Center(
        child: Text(e.toString()),
      ),
    );
  }
}
