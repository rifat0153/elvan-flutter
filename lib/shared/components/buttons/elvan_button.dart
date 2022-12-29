import 'package:flutter/material.dart';

import 'package:elvan/shared/constants/app_size.dart';

class ElvanButton extends StatelessWidget {
  const ElvanButton({
    super.key,
    required this.child,
    this.size = 24.0,
    this.color,
    this.radius,
    this.onPressed,
  });

  final Widget child;
  final double? size;
  final Color? color;
  final double? radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? AppSize.radius4XL),
        ),
      ),
      child: child,
    );
  }
}
