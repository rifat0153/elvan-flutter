import 'package:elvan/features/favorite/provider/favorite_provider.dart';
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
  });

  final FoodItem foodItem;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    FavoriteProvider favProvider = ref.read(favoriteProvider.notifier);
    // var fav = ref.watch(favoriteProvider);
    bool isFavorite = ref.watch(favoriteProvider.notifier).isFavorite(foodItem);
    print('isFavorite: $isFavorite');

    final Animation<Color?> colorTween = ColorTween(
      begin: AppColors.white,
      end: AppColors.primaryRed,
    ).animate(controller);

    useListenable(controller);

    return ElvanIconButton(
      icon: Icons.favorite,
      color: colorTween.value,
      onPressed: () {
        if (controller.isAnimating) return;

        if (isFavorite) {
          favProvider.removeFavorite(foodItem);
          controller.reverse();
        } else {
          favProvider.addFavorite(foodItem);
          controller.forward();
        }
        onPressed?.call();
      },
    );
  }
}
