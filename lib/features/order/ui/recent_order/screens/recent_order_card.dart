import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/shared/components/cards/base_card.dart';

class RecentOrderCard extends HookConsumerWidget {
  const RecentOrderCard({super.key, required this.cartItem});

  final CartItem cartItem;

  static final double imageTopOffset = -30.w;
  static final double imageLeftOffset = -60.w;
  static final double imageRadius = 60.w;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = '${cartItem.quantity}';
    final foodTitle = cartItem.foodItem.title;
    final imageUrl = cartItem.foodItem.imageUrl;
    final price = '${cartItem.foodItem.price}';

    return BaseCard(
      onTap: () {
        //add to cart

        ref.read(cartProvider.notifier).addToCart(cartItem);
      },
      padding: const EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  top: imageTopOffset,
                  left: imageLeftOffset,
                  child: CircleAvatar(
                    radius: imageRadius,
                    backgroundImage: CachedNetworkImageProvider(
                      imageUrl!,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSize.paddingXS),
                  AppText(
                    foodTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  const Spacer(),
                  const SizedBox(height: AppSize.paddingXS),
                  AppText(
                    quantity,
                    style: Theme.of(context).textTheme.bodySmall,
                    color: AppColors.primaryRed,
                  ),
                  const Spacer(),
                  const SizedBox(height: AppSize.paddingXS),
                  AppText(
                    price,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: AppSize.paddingXS),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppSize.paddingSM),
        ],
      ),
    );
  }
}
