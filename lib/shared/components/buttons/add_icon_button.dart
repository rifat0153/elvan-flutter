import 'package:elvan/shared/components/buttons/elvan_icon_button.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/hooks/use_button_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddIconButton extends HookWidget {
  const AddIconButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    const buttonInitialSize = 24.0;
    const buttonFinalSize = 32.0;

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final sizeTween = useButtonSizeAnimation(
      controller,
      buttonInitialSize,
      buttonFinalSize,
    );

    useListenable(controller);

    return ElvanIconButton(
      icon: Icons.add,
      size: sizeTween.value,
      color: AppColors.primaryRed,
      onPressed: () {
        if (controller.isAnimating) return;

        controller.reset();
        controller.forward();

        onPressed?.call();
      },
    );
  }
}
