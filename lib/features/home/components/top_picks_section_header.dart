import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopPicksSectionHeader extends StatelessWidget {
  const TopPicksSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Top Picks',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Color(AppColors.primaryTextWhite)),
        ),
        Spacer()
      ],
    );
  }
}
