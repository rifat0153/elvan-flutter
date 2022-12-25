import 'package:elvan/core/extensions/build_context/screen_size_ext.dart';
import 'package:elvan/shared/components/chips/elvan_chip.dart';
import 'package:flutter/material.dart';

class CategoryChipsRow extends StatelessWidget {
  const CategoryChipsRow({
    super.key,
    required this.categories,
  });

  final Iterable<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: Row(
        children: [
          for (final category in categories)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: EvlanChip(
                label: category,
              ),
            ),
        ],
      ),
    );
  }
}
