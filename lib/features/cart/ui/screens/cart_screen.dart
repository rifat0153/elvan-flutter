import 'package:elvan/features/cart/ui/components/cart_item_list.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/cart/ui/screens/empty_cart_screen.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_safe_remove_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan_shared/shared/components/buttons/elvan_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    return ElvanSafeRemoveScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: cartState.when(
        empty: () => const EmptyCartScreen(),
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
                    ref.read(cartProvider.notifier).orderPlaced(cart);
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
