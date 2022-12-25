import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';

class EvlanChip extends StatelessWidget {
  const EvlanChip({
    super.key,
    required this.label,
    this.labelColor,
    this.labelStyle,
    this.backgroundColor,
  });

  final String label;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.paddingMD,
        vertical: AppSize.paddingXS,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSize.kRadius * 2.5),
        border: Border.all(
          color: AppColors.white,
          width: 1,
        ),
      ),
      child: AppText(
        label,
        color: labelColor ?? AppColors.white,
        style: labelStyle ?? Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
