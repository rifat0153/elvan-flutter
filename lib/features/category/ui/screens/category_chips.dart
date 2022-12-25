// import 'package:elvan/features/category/ui/notifier/category_notifier%20copy.dart';
// import 'package:elvan/features/food/ui/food_list/notifier/selected_category_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class CategoryChips extends HookConsumerWidget {
//   const CategoryChips({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final categoriesState = ref.watch(categoryNotifierProvider);

//     return categoriesState.when(
//       data: (categories) => SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Row(
//           children: [
//             for (final category in categories)
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: ChoiceChip(
//                   label: Text(category.name),
//                   selected: ref.watch(selectedCategoryNotifierProvider).state ==
//                       category,
//                   onSelected: (selected) {
//                     ref.read(selectedCategoryNotifierProvider).state =
//                         selected ? category : null;
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//       loading: () => const Center(child: CircularProgressIndicator()),
//       error: (error) => Text(error.toString()),
//     );
//   }
// }
