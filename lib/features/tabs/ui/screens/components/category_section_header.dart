import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class CategorySectionHeader extends StatelessWidget {
  const CategorySectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Categories',
          //   style: Theme.of(context).textTheme.headlineMedium,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        Text(
          'View all',
          // style: Theme.of(context).textTheme.labelMedium),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
