import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/hooks/use_button_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    const buttonInitialSize = 24.0;
    const buttonFinalSize = 32.0;

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    final sizeTween = useButtonSizeAnimation(controller, false, buttonInitialSize, buttonFinalSize);

    final Animation<Color?> colorTween = ColorTween(
      begin: isFavorite ? AppColors.primaryRed : AppColors.white,
      end: isFavorite ? AppColors.white : AppColors.primaryRed,
    ).animate(controller);

    useListenable(controller);

    return IconButton(
      iconSize: sizeTween.value,
      color: colorTween.value,
      icon: const Icon(Icons.favorite),
      onPressed: () {
        if (controller.isAnimating) return;

        controller.reset();
        controller.forward();
        if (onPressed != null) onPressed!();
      },
    );
  }
}
