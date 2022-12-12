import 'package:cached_network_image/cached_network_image.dart';
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
          CachedNetworkImage(
            imageUrl: category.imageUrl ?? '',
            width: 60.w,
            height: 60.w,
            fit: BoxFit.cover,
          ),
          Text(
            category.title ?? '',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: AppSize.paddingXS),
        ],
      ),
    );
  }
}
