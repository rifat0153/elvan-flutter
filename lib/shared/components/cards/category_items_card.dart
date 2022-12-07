import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:elvan/shared/components/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryItemsCard extends StatelessWidget {
  //const CategoryItemsCard({super.key});

  final String categoryName;
  final String imageUrl;

  const CategoryItemsCard(
      {super.key, required this.categoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      height: 123,
      width: 102,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UiConstants.cardBorderRadius),
          color: const Color(AppColors.cardColorGrey70).withOpacity(0.7)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image(
            height: 58,
            width: 58,
            image: AssetImage(
              imageUrl,
            ),
          )),
          const SizedBox(
            height: 15.5,
          ),
          Text(categoryName,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .merge(UiConstants.poppinsLabelSmall11_16_05))
        ],
      ),
    );
  }
}
