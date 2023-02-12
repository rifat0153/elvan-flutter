import 'package:auto_route/auto_route.dart';
import 'package:elvan/app/router/app_router.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/order/data/repository/order_repository_impl.dart';
import 'package:elvan/features/order/ui/recent_order/notifier/order_notifier.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan_shared/domain_models/order/order.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/cart/ui/components/cart_item_list.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/constants/app_asset.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final orderRepository = ref.watch(orderRepositoryProvider);

    return ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: cartState.when(
        empty: () => const Center(child: Text('Empty cart')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, st) => Center(child: Text(error.toString())),
        data: (cart) {
          return Column(
            children: [
              ElvanAppBar(title: 'Your Cart'),
              Expanded(
                child: CartItemList(
                  cartItems: cart.cartItems,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var orderId = await ref
                      .read(orderProvider.notifier)
                      .createOrderFromCart();

                  var orderDto = await orderRepository.getSingleOrder(orderId);

                  var order = Order.fromDto(orderDto);
                  // ignore: use_build_context_synchronously
                  context.replaceRoute(
                    OrderRouter(
                      children: [
                        SingleOrderRoute(order: order),
                      ],
                    ),
                  );
                },
                child: const Text('Checkout'),
              ),
            ],
          );
        },
      ),
    );
  }
}
