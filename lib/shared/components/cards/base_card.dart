import 'package:flutter/material.dart';

import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_shadows.dart';
import 'package:elvan/shared/constants/app_size.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.decoration,
    this.padding,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        clipBehavior: Clip.antiAlias,
        decoration: decoration ??
            BoxDecoration(
              color: AppColors.grey_70,
              borderRadius: BorderRadius.circular(AppSize.radiusSM * 1.5),
              boxShadow: const [
                AppShadows.shadow1,
              ],
            ),
        padding: padding ?? const EdgeInsets.all(AppSize.paddingSM),
        child: child,
      ),
    );
  }
}
