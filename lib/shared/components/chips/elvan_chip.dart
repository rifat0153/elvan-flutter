import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';

class EvlanChip extends StatelessWidget {
  const EvlanChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.kRadius * 2.5),
          border: Border.all(
            color: AppColors.white,
            width: 1,
          ),
        ),
        child: AppText(
          label,
          color: AppColors.white,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
