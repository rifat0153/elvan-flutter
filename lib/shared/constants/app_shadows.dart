import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';

@immutable
class AppShadows {
  const AppShadows._();

  static const shadow1 = BoxShadow(
    color: AppColors.black_10,
    blurRadius: AppSize.radiusMD,
    offset: Offset(0, AppSize.radiusSM),
  );
}
