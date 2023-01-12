import 'dart:developer';

import 'package:elvan/features/order/data/repository/order_repository_impl.dart';
import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/ui/components/order_records_app_bar.dart';
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
                  onPressed: () {},
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
            'Order Progress',
            style: Theme.of(context).textTheme.headline6,
          ),
          OrderTimeLine(
            isCompleted: order.status.index >= 1,
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

class OrderTimeLine extends StatelessWidget {
  const OrderTimeLine({
    this.isLast = false,
    this.isFirst = false,
    required this.title,
    this.isCompleted = false,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool isLast;
  final bool isFirst;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      afterLineStyle: const LineStyle(color: AppColors.primaryRed),
      beforeLineStyle: const LineStyle(color: AppColors.primaryRed),
      indicatorStyle: IndicatorStyle(
        width: 25,
        color: AppColors.primaryRed,
        indicator: !isCompleted
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      border: Border.all(
                        width: 2,
                        color: AppColors.primaryRed,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryRed,
                    ),
                  )
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  AppAsset.checkboxState,
                  fit: BoxFit.cover,
                ),
              ),
      ),
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      endChild: Container(
        constraints: const BoxConstraints(
          minHeight: 70,
        ),
        child: Center(
          child: AppText(
            title,
            color: isCompleted ? AppColors.white : Colors.grey,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      startChild: Container(
        child: const AppText("2:00 PM"),
      ),
    );
  }
}

class OrderSummery extends StatelessWidget {
  const OrderSummery({
    Key? key,
    required this.orderID,
    required this.estimatedTime,
  }) : super(key: key);

  final String orderID;
  final String estimatedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.primaryRed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppText("Estimated Time"),
                  AppText(
                    "30 Min",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppText("Your Order ID"),
                  AppText(
                    "#$orderID",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
