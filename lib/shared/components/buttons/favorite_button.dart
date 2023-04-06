// import 'package:elvan/features/favorite/provider/favorite_provider.dart';
import 'package:elvan_shared/domain_models/food/food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:elvan/shared/components/buttons/elvan_icon_button.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteButton extends HookConsumerWidget {
  const FavoriteButton({
    super.key,
    required this.foodItem,
    this.onPressed,
    required this.isFavorite,
  });

  final FoodItem foodItem;
  final void Function()? onPressed;
  final bool isFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final Animation<Color?> colorTween = ColorTween(
      begin: AppColors.white,
      end: AppColors.primaryRed,
    ).animate(controller);

    useListenable(controller);

    if (isFavorite) {
      controller.value = 1;
    } else {
      controller.value = 0;
    }

    return ElvanIconButton(
      icon: Icons.favorite,
      color: colorTween.value,
      size: 20,
      onPressed: () {
        if (controller.isAnimating) return;

        controller.reset();
        onPressed?.call();
        if (isFavorite) {
          controller.reverse();
        } else {
          controller.forward();
        }
      },
    );
  }
}
