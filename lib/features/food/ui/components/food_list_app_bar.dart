import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/app/router/navigator_provider.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/shared/components/badge/elvan_icon_badge.dart';
import 'package:elvan/shared/constants/app_colors.dart';

class FoodListAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const FoodListAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: AppColors.primaryRed,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => ref.read(navigatorProvider.notifier).pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
      ),
      title: SvgPicture.asset(
        AppAsset.logoSvg,
        height: 28,
        width: 103,
      ),
      actions: [
        Consumer(builder: (context, ref, child) {
          final cartItemCount = ref.watch(cartProvider).cartItems?.length ?? 0;

          return ElvanIconBadge(
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColors.white,
            ),
            count: cartItemCount,
            onPressed: ref.read(navigatorProvider.notifier).pushCartRoute,
          );
        }),
      ],
    );
  }
}
