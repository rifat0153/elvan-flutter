import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/order/ui/recent_order/notifier/order_notifier.dart';
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

    return ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: cartState.when(
        empty: () => const Center(child: Text('Empty cart')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, st) => Center(child: Text(error.toString())),
        data: (cart) {
          return Column(
            children: [
              Expanded(
                child: CartItemList(
                  cartItems: cart.cartItems,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(orderProvider.notifier).createOrderFromCart();
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
