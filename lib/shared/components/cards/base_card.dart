import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_shadows.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.decoration,
    this.padding,
  }) : super(key: key);

  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: decoration ??
          BoxDecoration(
            color: AppColors.gray_70,
            borderRadius: BorderRadius.circular(AppSize.radiusMD.r / 1.5),
            boxShadow: const [
              AppShadows.shadow1,
            ],
          ),
      padding: padding ?? const EdgeInsets.all(AppSize.paddingSM),
      child: child,
    );
  }
}
