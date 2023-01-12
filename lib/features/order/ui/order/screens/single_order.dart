import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/ui/components/order_records_app_bar.dart';
import 'package:elvan/features/order/ui/order_records/notifier/order_records_notifier.dart';
import 'package:elvan/features/order/ui/order_records/screens/order_records.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:elvan_shared/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SingleOrderScreen extends HookConsumerWidget {
  const SingleOrderScreen({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRecordsNotifier = ref.watch(orderRecordsNotifierProvider);

    return orderRecordsNotifier.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (orders) => ElvanScaffold(
        imagePath: AppAsset.homeBackgroundPng,
        appBar: const ElvanAppBar(
          title: 'Your Order',
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderSummery(),
            Padding(
              padding: const EdgeInsets.all(AppSize.paddingMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Order Progress',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  OrderTimeLine(
                    isCompleted: true,
                    isFirst: true,
                    title: "Order Successfully Placed",
                  ),
                  OrderTimeLine(
                    title: "Order is being prepared",
                  ),
                  OrderTimeLine(
                    isLast: true,
                    title: "Ready to pickup",
                  ),
                  AppText(
                    'Order Items',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  OrderCard(order: order)
                ],
              ),
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
                      borderRadius: BorderRadius.all(
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
        child: AppText("2:00 PM"),
      ),
    );
  }
}

class OrderSummery extends StatelessWidget {
  const OrderSummery({
    Key? key,
  }) : super(key: key);

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
                  AppText("Estimated Time"),
                  AppText(
                    "30 Min",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText("Your Order ID"),
                  AppText(
                    "#123456",
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
