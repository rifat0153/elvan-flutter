import 'package:flutter/material.dart';

import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';
import 'package:elvan/features/cart/ui/components/cart_item_card.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];

        return CartItemCard(item);
      },
    );
  }
}
