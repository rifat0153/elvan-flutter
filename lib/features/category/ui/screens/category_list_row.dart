import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/features/category/ui/screens/category_card.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';

class CategiryListRow extends StatelessWidget {
  const CategiryListRow({super.key, required this.categories});

  final Iterable<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: AppSize.paddingSM),
          ...categories
              .map(
                (category) => CategoryCard(category: category),
              )
              .toList(),
          const SizedBox(width: AppSize.paddingSM)
        ],
      ),
    );
    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: categories.length,
    //   itemBuilder: (context, index) {
    //     final category = categories.elementAt(index);
    //     return CategoryCard(category: category);
    //   },
    // );
  }
}
