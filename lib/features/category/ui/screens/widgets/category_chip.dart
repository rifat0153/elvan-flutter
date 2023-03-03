import 'package:elvan/shared/components/chips/elvan_chip.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan_shared/dtos/category/category/category.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.category,
    required this.onTap,
    this.isSelected = false,
  });

  final Category category;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: EvlanChip(
        label: category.title,
        backgroundColor: isSelected ? AppColors.primaryRed : Colors.transparent,
        labelColor: AppColors.white,
      ),
    );
  }
}
