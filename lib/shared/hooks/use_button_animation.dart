import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Animation<double> useButtonSizeAnimation(
  AnimationController controller,
  double initialSize,
  double finalSize,
) {
  return use(
    _ButtonSizeAnimation(
      controller,
      initialSize,
      finalSize,
    ),
  );
}

class _ButtonSizeAnimation extends Hook<Animation<double>> {
  const _ButtonSizeAnimation(
    this.controller,
    this.initialSize,
    this.finalSize,
  );

  final AnimationController controller;
  final double initialSize;
  final double finalSize;

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<Animation<double>, _ButtonSizeAnimation> {
  late final Animation<double> sizeTween = TweenSequence<double>(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: hook.initialSize, end: hook.finalSize).chain(
          CurveTween(
            curve: Curves.ease,
          ),
        ),
        weight: 40.0,
      ),
      TweenSequenceItem<double>(
        tween: ConstantTween<double>(hook.finalSize),
        weight: 20.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: hook.finalSize, end: hook.initialSize).chain(
          CurveTween(
            curve: Curves.ease,
          ),
        ),
        weight: 40.0,
      ),
    ],
  ).animate(hook.controller);

  @override
  void initHook() {
    super.initHook();
  }

  @override
  build(BuildContext context) => sizeTween;

  @override
  void dispose() {
    super.dispose();
  }
}
