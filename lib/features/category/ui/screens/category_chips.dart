import 'package:collection/collection.dart';
import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/features/category/ui/notifier/selected_category_notifier.dart';
import 'package:elvan/features/category/ui/screens/widgets/category_chip.dart';
import 'package:elvan/shared/constants/app_size.dart';

class CategoryChips extends HookConsumerWidget {
  const CategoryChips({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoryNotifierProvider);
    final selectedCategories = ref.watch(selectedCategoriesNotifierProvider);

    return categoriesState.when(
      data: (categories) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories
                .mapIndexed(
                  (i, category) => Padding(
                    padding: EdgeInsets.only(
                      right: AppSize.paddingSM,
                      left: i == 0 ? AppSize.paddingMD : 0,
                    ),
                    child: CategoryChip(
                      key: ValueKey(category.hashCode),
                      category: category,
                      isSelected: selectedCategories.contains(
                        category,
                      ),
                      onTap: () {
                        logInfo('${category.title} is tapped}');

                        ref
                            .read(
                              selectedCategoriesNotifierProvider.notifier,
                            )
                            .toggleCategory(category);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, st) => Text(error.toString()),
    );
  }
}
