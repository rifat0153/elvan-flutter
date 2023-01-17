import 'dart:developer';

import 'package:elvan/features/order/data/repository/order_repository_impl.dart';
import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/ui/components/order_records_app_bar.dart';
import 'package:elvan/features/order/ui/components/order_summery.dart';
import 'package:elvan/features/order/ui/components/order_timeline.dart';
import 'package:elvan/features/order/ui/order_records/notifier/order_records_notifier.dart';
import 'package:elvan/features/order/ui/order_records/notifier/single_order_provider.dart';
import 'package:elvan/features/order/ui/order_records/screens/order_records.dart';
import 'package:elvan/features/order/ui/recent_order/notifier/latest_order_provider.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:elvan_shared/domain_models/order/order_status.dart';
import 'package:elvan_shared/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SingleOrderScreen extends HookConsumerWidget {
  const SingleOrderScreen({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRecordsNotifier = ref.watch(orderRecordsNotifierProvider);

    final currentOrder = ref.watch(singleOrderProvider(order.id));

    return orderRecordsNotifier.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (orders) => ElvanScaffold(
        imagePath: AppAsset.homeBackgroundPng,
        appBar: const ElvanAppBar(
          title: 'Your Order',
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderSummery(
                  estimatedTime: '',
                  orderID: order.id,
                ),
                currentOrder.when(
                  data: (order) {
                    log(order.status.toString());
                    return OrderTimeline(order: order);
                  },
                  error: (e, st) => Center(
                    child: Text(e.toString()),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(1.sw, 34),
                    backgroundColor: AppColors.primaryRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.radiusLG),
                    ),
                  ),
                  onPressed: () async {
                    await ref
                        .read(orderRecordsNotifierProvider.notifier)
                        .cancleOrder(
                          order.id,
                        );
                  },
                  child: const AppText("Cancel")),
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

class OrderTimeline extends StatelessWidget {
  const OrderTimeline({
    required this.order,
    Key? key,
  }) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    log(order.status.index.toString());
    return Padding(
      padding: const EdgeInsets.all(AppSize.paddingMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Order Status',
            style: Theme.of(context).textTheme.headline6,
          ),
          OrderTimeLine(
            isCompleted: order.status.index >= 0,
            isFirst: true,
            title: "Order Successfully Placed",
          ),
          OrderTimeLine(
            isCompleted: order.status.index >= 2,
            title: "Order is being prepared",
          ),
          OrderTimeLine(
            isCompleted: order.status.index >= 3,
            isLast: false,
            title: "Ready to pickup",
          ),
          if (order.status.index >= 5)
            OrderTimeLine(
              isCompleted: order.status.index >= 4,
              isLast: true,
              title: "Delivered",
            )
          else
            OrderTimeLine(
              isCompleted: order.status.index >= 4,
              isLast: true,
              title: "Delivered",
            ),
          AppText(
            'Order Items',
            style: Theme.of(context).textTheme.headline6,
          ),
          OrderCard(order: order),
        ],
      ),
    );
  }
}
