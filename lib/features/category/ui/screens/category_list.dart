import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/features/category/ui/screens/category_list_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryList extends HookConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(categoryNotifierProvider);

    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      // height: 150,
      child: uiState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (categories) => CategiryListRow(categories: categories),
        error: (message) => Center(child: Text(message ?? 'An error occurred')),
      ),
    );
  }
}
