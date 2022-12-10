import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            category.title ?? '',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 8),
          Text(
            category.description ?? '',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
