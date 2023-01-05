import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/ui/components/order_records_app_bar.dart';
import 'package:elvan/features/order/ui/order_records/notifier/order_records_notifier.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SingleOrderScreen extends HookConsumerWidget {
  const SingleOrderScreen({super.key, required Order order});
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
            AppText("ORDER PAGE")
          ],
        ),
      ),
      error: (e, st) => Center(
        child: Text(e.toString()),
      ),
    );
  }
}
