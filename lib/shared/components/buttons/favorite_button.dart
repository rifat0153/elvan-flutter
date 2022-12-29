import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:elvan/shared/components/buttons/elvan_icon_button.dart';
import 'package:elvan/shared/constants/app_colors.dart';

class FavoriteButton extends HookWidget {
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    this.onPressed,
  });

  final bool isFavorite;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final Animation<Color?> colorTween = ColorTween(
      begin: isFavorite ? AppColors.primaryRed : AppColors.white,
      end: isFavorite ? AppColors.white : AppColors.primaryRed,
    ).animate(controller);

    useListenable(controller);

    return ElvanIconButton(
      icon: Icons.favorite,
      color: colorTween.value,
      onPressed: () {
        if (controller.isAnimating) return;

        controller.reset();
        controller.forward();

        onPressed?.call();
      },
    );
  }
}
