import 'dart:developer';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:elvan/features/order/ui/components/order_summery.dart';
import 'package:elvan/features/order/ui/components/order_timeline.dart';
import 'package:elvan/features/order/ui/order_records/notifier/order_records_notifier.dart';
import 'package:elvan/features/order/ui/order_records/notifier/single_order_provider.dart';
import 'package:elvan/features/order/ui/order_records/screens/order_records.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan/shared/providers/scaffold_messenger/snackbar_provider.dart';
import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:elvan_shared/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SingleOrderScreen extends HookConsumerWidget {
  const SingleOrderScreen({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderRecordsNotifier = ref.watch(orderRecordsNotifierProvider);

    final currentOrder = ref.watch(singleOrderProvider(order.id));

    var snakbar = ref.read(snackbarNotifierProvider.notifier);

    return orderRecordsNotifier.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (orders) => ElvanScaffold(
        imagePath: AppAsset.homeBackgroundPng,
        appBar: ElvanAppBar(
          title: AppLocalizations.of(context)!.yourOrder,
        ),
        child: Stack(
          children: [
            currentOrder.when(
              data: (Order order) {
                log(order.status.toString());
                return Column(
                  children: [
                    OrderSummery(
                      estimatedTime: (order.orderPreparationTime ?? 20) / 60,
                      orderID: order.id,
                    ),
                    OrderTimeline(order: order),
                  ],
                );
              },
              error: (e, st) => Center(
                child: Text(e.toString()),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
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
                    snakbar.alartDialog(
                      title: AppLocalizations.of(context)!.cancleOrder,
                      content: AppLocalizations.of(context)!.cancleOrderMessage,
                      onOk: () async {
                        Navigator.of(context).pop();
                        await ref
                            .read(orderRecordsNotifierProvider.notifier)
                            .cancleOrder(
                              order.id,
                            );
                        snakbar.closeAlartDialog();

                        snakbar.showSnackbar(
                          const SnackBar(
                            content: Text("Order Cancelled"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    );
                  },
                  child: AppText(AppLocalizations.of(context)!.cancel)),
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
            AppLocalizations.of(context)!.orderStatus,
            style: Theme.of(context).textTheme.headline6,
          ),
          OrderTimeLine(
            isCompleted: order.status.index >= 0,
            isFirst: true,
            title: AppLocalizations.of(context)!.orderSuccfullyPlaced,
          ),
          OrderTimeLine(
            isCompleted: order.status.index >= 2,
            title: AppLocalizations.of(context)!.orderIsBeingPrepared,
          ),
          OrderTimeLine(
            isCompleted: order.status.index >= 3,
            isLast: false,
            title: AppLocalizations.of(context)!.readyToPickUp,
          ),
          if (order.status.index >= 5)
            OrderTimeLine(
              isCompleted: order.status.index >= 4,
              isLast: true,
              title: order.status.status.toUpperCase(),
            )
          else
            OrderTimeLine(
              isCompleted: order.status.index >= 4,
              isLast: true,
              title: AppLocalizations.of(context)!.delivered,
            ),
          AppText(
            AppLocalizations.of(context)!.orderItems,
            style: Theme.of(context).textTheme.headline6,
          ),
          OrderCard(order: order),
        ],
      ),
    );
  }
}
