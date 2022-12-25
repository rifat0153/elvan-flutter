import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtonBase extends HookConsumerWidget {
  const ButtonBase({
    super.key,
    required this.child,
    this.onPressed,
    this.sizeTweenSequence,
    this.colorTween,
  });

  final Widget child;
  final void Function()? onPressed;
  final TweenSequence<double>? sizeTweenSequence;
  final ColorTween? colorTween;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const buttonInitialSize = 24.0;
    const buttonFinalSize = 32.0;

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    final Animation<double> sizeTween = sizeTweenSequence?.animate(controller) ??
        TweenSequence<double>(
          <TweenSequenceItem<double>>[
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: buttonInitialSize, end: buttonFinalSize).chain(
                CurveTween(
                  curve: Curves.ease,
                ),
              ),
              weight: 40.0,
            ),
            // TweenSequenceItem<double>(
            //   tween: ConstantTween<double>(buttonFinalSize),
            //   weight: 20.0,
            // ),
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: buttonFinalSize, end: buttonInitialSize).chain(
                CurveTween(
                  curve: Curves.ease,
                ),
              ),
              weight: 40.0,
            ),
          ],
        ).animate(controller);

    useListenable(controller);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorTween?.evaluate(controller),
        shape: const CircleBorder(),
        padding: EdgeInsets.all(sizeTween.value / 2),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
