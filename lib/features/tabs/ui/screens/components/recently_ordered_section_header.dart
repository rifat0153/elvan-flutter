import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentlyOrderedSectionHeader extends StatelessWidget {
  const RecentlyOrderedSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Recently Ordered',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(AppColors.primaryTextWhite)),
        ),
        Text(
          'view all',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.textGreyA7),
          ),
        ),
      ],
    );
  }
}
