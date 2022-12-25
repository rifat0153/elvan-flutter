import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/features/category/ui/screens/widgets/category_list_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryListWidget extends HookConsumerWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(categoryNotifierProvider);

    return uiState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (categories) => CategiryListRow(categories: categories),
      error: (message, st) => Center(
        child: Text(message.toString()),
      ),
    );
  }
}
