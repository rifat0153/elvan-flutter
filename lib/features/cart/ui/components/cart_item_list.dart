import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';

import 'package:elvan/features/cart/domain/models/cart_item/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return ListTile(
          title: AppText(item.foodItem.title),
          subtitle: AppText(item.foodItem.description!),
          trailing: AppText(item.quantity.toString()),
        );
      },
    );
  }
}
