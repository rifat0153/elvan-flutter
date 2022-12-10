import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/features/category/ui/screens/category_card.dart';
import 'package:flutter/material.dart';

class CategiryListRow extends StatelessWidget {
  const CategiryListRow({super.key, required this.categories});

  final Iterable<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories.elementAt(index);
        return CategoryCard(category: category);
      },
    );
  }
}
