import 'package:elvan/app/router/app_router.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/cart/ui/components/cart_item_list.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/order/data/repository/order_repository_impl.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';
import 'package:elvan/features/order/ui/recent_order/notifier/order_notifier.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:elvan_shared/shared/components/buttons/elvan_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final orderRepository = ref.watch(orderRepositoryProvider);

    return ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: cartState.when(
        empty: () => Center(
            child: Padding(
          padding: const EdgeInsets.only(top: AppSize.padding4XL),
          child: Column(
            children: [
              Image.asset(AppAsset.emptyCart, height: 300),
              AppText("Sorry!", style: Theme.of(context).textTheme.headline2),
              const SizedBox(height: AppSize.kPadding),
              AppText("Your cart is empty",
                  style: Theme.of(context).textTheme.headline5),
            ],
          ),
        )),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, st) => Center(child: Text(error.toString())),
        data: (cart) {
          return Column(
            children: [
              ElvanAppBar(title: AppLocalizations.of(context)!.yourCart),
              Expanded(
                child: CartItemList(
                  cartItems: cart.cartItems,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.paddingMD,
                  vertical: AppSize.paddingMD,
                ),
                child: ElvanButton(
                  color: AppColors.primaryRed,
                  onPressed: () async {
                    //check if order is in progress then show dialog
                    final isOrderInProgress =
                        await orderRepository.isOrderInProgress(cart.userId);

                    final isTakingOrder = ref.read(isTakingOrderProvider);
                    print("------------value ${isTakingOrder.value}");
                    if (!isTakingOrder.value!) {
                      //show dialog

                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text(AppLocalizations.of(context)!.sorry),
                              content: Text(
                                  AppLocalizations.of(context)!.noTakingOrders),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      ref.read(appRouterProvider).pop();
                                    },
                                    child: const Text('Ok'))
                              ],
                            );
                          });
                      return;
                    }

                    if (!isOrderInProgress) {
                      //show dialog

                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text(
                                  AppLocalizations.of(context)!.orderInProcess),
                              content: Text(AppLocalizations.of(context)!
                                  .orderInProcessMessage),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      ref.read(appRouterProvider).pop();
                                    },
                                    child: const Text('Ok'))
                              ],
                            );
                          });
                      return;
                    }

                    var orderId = await ref
                        .read(orderProvider.notifier)
                        .createOrderFromCart();

                    var orderDto =
                        await orderRepository.getSingleOrder(orderId);

                    var order = Order.fromDto(orderDto);
                    // ignore: use_build_context_synchronously
                    ref.read(appRouterProvider).replace(
                          OrderRouter(
                            children: [
                              SingleOrderRoute(order: order),
                            ],
                          ),
                        );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: AppText(
                        AppLocalizations.of(context)!.addToCart,
                        color: AppColors.white,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
