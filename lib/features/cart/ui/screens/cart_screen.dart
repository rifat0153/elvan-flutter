import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
import 'package:elvan/features/cart/ui/components/cart_item_list.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartNotifierProvider);

    return ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: cartProvider.when(
        empty: () => const Center(child: Text('Empty cart')),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, st) => Center(child: Text(error.toString())),
        data: (cart) {
          return CartItemList(
            cartItems: cart.cartItems,
          );
        },
      ),
    );
  }
}
