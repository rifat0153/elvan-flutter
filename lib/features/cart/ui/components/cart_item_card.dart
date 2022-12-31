import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartItemCard extends HookConsumerWidget {
  const CartItemCard(this.cartItem, {super.key});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
