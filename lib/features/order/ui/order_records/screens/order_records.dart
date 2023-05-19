import 'package:auto_route/auto_route.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/order/ui/components/order_records_app_bar.dart';
import 'package:elvan/features/order/ui/order_records/notifier/order_records_stream_provider.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrdersRecordsScreen extends HookConsumerWidget {
  const OrdersRecordsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderNotifier = ref.watch(orderStreamProvider);

    return orderNotifier.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (orders) {
        return ElvanScaffold(
          imagePath: AppAsset.homeBackgroundPng,
          appBar: const OrderRecordsAppBar(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSize.paddingMD),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSize.paddingMD),
                    child: AppText(
                      'Your last orders',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      var order = orders[index];
                      return InkWell(
                          onTap: () {
                            context.pushRoute(
                              SingleOrderRoute(
                                order: order,
                              ),
                            );
                          },
                          child: OrderCard(order: order));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, st) => Center(
        child: Text(e.toString()),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: AppSize.paddingMD / 2),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.15),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                AppAsset.halfPizzaPng,
                fit: BoxFit.fitHeight,
                //round top left corner
                width: 80,
              ),
            ),
            const SizedBox(
              width: AppSize.paddingMD,
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var item in order.items)
                    AppText(
                      '${item.foodItem.title} x${item.quantity}',
                      style: item == order.items.first ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                    ),
                ],
              ),
            ),
            const Spacer(),
            AppText(
              "\$${order.total}",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              width: AppSize.paddingMD,
            )
          ],
        ));
  }
}

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: AppSize.paddingMD / 2),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.15),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                AppAsset.halfPizzaPng,
                fit: BoxFit.fitHeight,
                //round top left corner
                width: 80,
              ),
            ),
            const SizedBox(
              width: AppSize.paddingMD,
            ),
            Flexible(
              flex: 3,
              child: AppText(
                '${cartItem.foodItem.title} x${cartItem.quantity}',
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 3,
              ),

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     for (var item in order.items)
              //       AppText(
              //         '${item.foodItem.title} x${item.quantity}',
              //         style: item == order.items.first
              //             ? Theme.of(context).textTheme.headline4
              //             : Theme.of(context).textTheme.bodyText1,
              //         maxLines: 3,
              //       ),
              //   ],
              // ),
            ),
            const Spacer(),
            AppText(
              "\$${cartItem.foodItem.price}",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              width: AppSize.paddingMD,
            )
          ],
        ));
  }
}
