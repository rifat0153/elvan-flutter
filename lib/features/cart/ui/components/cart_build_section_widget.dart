import 'package:elvan_shared/dtos/index.dart';
import 'package:flutter/material.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';

class CartItemBuildStepWidget extends StatelessWidget {
  const CartItemBuildStepWidget({super.key, required this.buildStep});

  final BuildStep buildStep;

  @override
  Widget build(BuildContext context) {
    final selectedAddOns = buildStep.addOns.where((e) => e.isSelected).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          buildStep.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        ...selectedAddOns.map(
          (addOn) => AppText(
            addOn.title,
            style: Theme.of(context).textTheme.titleSmall,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
