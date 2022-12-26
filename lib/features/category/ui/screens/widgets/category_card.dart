import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';

class CategoryCard extends HookConsumerWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(categoryNotifierProvider.notifier).resetSelectedAndNew(category);
        context.pushRoute(const FoodRouter());
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
              category.title,
              style: Theme.of(context).textTheme.titleMedium,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
