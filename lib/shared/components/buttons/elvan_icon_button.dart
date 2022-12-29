import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:elvan/shared/hooks/use_button_animation.dart';

class ElvanIconButton extends HookWidget {
  const ElvanIconButton({
    super.key,
    required this.icon,
    this.size = 24.0,
    this.color,
    this.onPressed,
  });

  final IconData icon;
  final double? size;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final sizeTween = useButtonSizeAnimation(
      controller,
      size!,
      size! * 1.25,
    );

    useListenable(controller);

    return IconButton(
      iconSize: sizeTween.value,
      color: color,
      icon: Icon(icon),
      onPressed: () {
        if (controller.isAnimating) return;

        controller.reset();
        controller.forward();

        onPressed?.call();
      },
    );
  }
}
