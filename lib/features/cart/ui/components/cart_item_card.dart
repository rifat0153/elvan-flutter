import 'package:auto_route/auto_route.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/cart/ui/notifier/cart_update_notifier.dart';
import 'package:elvan/shared/components/buttons/elvan_button.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/features/cart/ui/components/cart_build_section_widget.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_size.dart';

class CartItemCard extends HookConsumerWidget {
  const CartItemCard(this.cartItem, {super.key});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSize.paddingMD,
        left: AppSize.paddingMD,
        right: AppSize.paddingMD,
      ),
      child: BaseCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              cartItem.foodItem.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),

            const SizedBox(height: AppSize.paddingSM),

            AppText(
              '\$${cartItem.price}',
              letterSpacing: 0.8,
            ),
            const SizedBox(height: AppSize.paddingSM),

            // const SizedBox(height: AppSize.paddingMD),
            ...cartItem.buildSteps
                .where((bs) => bs.selectedAddOnsCount > 0)
                .map(
                  (e) => CartItemBuildStepWidget(buildStep: e),
                )
                .toList(),

            const SizedBox(height: AppSize.paddingMD),

            ElvanButton(
              onPressed: () {
                ref
                    .read(cartItemUpdateProvider.notifier)
                    .setUpdatingCartItem(cartItem);

                context.pushRoute(
                  const FoodRouter(children: [
                    FooDDetailRoute(),
                  ]),
                );
              },
              child: AppText(
                'Customize',
                color: AppColors.primaryRed,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
