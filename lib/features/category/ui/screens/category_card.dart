import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_shadows.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/food/list');
      },
      child: BaseCard(
        width: 120.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: category.imageUrl ?? '',
              width: 60,
              height: 60,
              // height: 120.h,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: AppSize.paddingSM),
            AppText(
              category.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
