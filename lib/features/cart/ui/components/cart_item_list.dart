import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:elvan_shared/shared/providers/scaffold_messenger/snackbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:elvan/features/cart/ui/components/cart_item_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartItemList extends ConsumerWidget {
  const CartItemList({
    super.key,
    required this.cartItems,
  });

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];

        return Dismissible(
          key: ValueKey(item.id),
          child: CartItemCard(item),
          onDismissed: (direction) {
            ref.read(cartProvider.notifier).removeFromCart(item);
            ref.read(snackbarNotifierProvider.notifier).showSnackbarWithAction(
                  'Removed from cart',
                  actionLabel: 'Undo',
                  onAction: () =>
                      ref.read(cartProvider.notifier).addToCart(item),
                );
          },
        );
      },
    );
  }
}
