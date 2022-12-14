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
          const SizedBox(width: AppSize.paddingMD),
          for (final category in categories) ...[
            CategoryCard(category: category),
            const SizedBox(
              width: AppSize.paddingMD,
            ),
          ],
          const SizedBox(width: AppSize.paddingMD),
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
