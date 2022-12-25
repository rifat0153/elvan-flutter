import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ElvanIconButton extends HookWidget {
  const ElvanIconButton({
    super.key,
    required this.icon,
    this.size,
    this.color,
    this.onPressed,
  });

  final IconData icon;
  final double? size;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size,
      color: color,
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }
}
