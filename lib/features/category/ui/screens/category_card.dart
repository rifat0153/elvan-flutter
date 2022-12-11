import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: AppSize.iconSizeLG.r,
            backgroundImage: NetworkImage(category.imageUrl ?? ''),
          ),
          Text(
            category.title ?? '',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: AppSize.paddingXS),
          Text(
            category.description ?? '',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
