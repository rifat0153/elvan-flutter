import 'package:elvan/features/food/providers/food_detail/selected_food_item_provider.dart';
import 'package:elvan/features/food/providers/food_list/food_list_provider.dart';
import 'package:elvan/features/tabs/ui/sections/category_section.dart';
import 'package:elvan/features/tabs/ui/sections/recently_ordered_section.dart';
import 'package:elvan/features/tabs/ui/sections/top_picks_section.dart';
import 'package:elvan/shared/components/appbars/main_appbar.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:elvan/shared/components/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodList = ref.watch(foodListProvider);

    return Scaffold(
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('Home Screen'),
      //     ElevatedButton(
      //       onPressed: () {},
      //       child: const Text('Navigate to Food Navigator: Detail'),
      //     ),
      //     foodList.when(
      //       data: (foodList) => SingleChildScrollView(
      //         child: ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: foodList.length,
      //           itemBuilder: (context, index) {
      //             final foodItem = foodList[index];

      //             return GestureDetector(
      //               key: ValueKey(foodItem.id),
      //               onTap: () {
      //                 ref.read(selectedFoodItemProvider.notifier).state = foodItem;

      //                 context.go('/food/${foodItem.id}');
      //               },
      //               child: Column(
      //                 children: [
      //                   Hero(
      //                     tag: foodItem.id ?? '',
      //                     child: Image.network(
      //                       foodItem.imageUrl ?? '',
      //                       height: 100,
      //                       width: 100,
      //                     ),
      //                   ),
      //                   Text(foodList[index].title),
      //                 ],
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //       loading: () => const CircularProgressIndicator(),
      //       error: (error, stack) => Text(error.toString()),
      //     )
      //   ],
      // ),
      appBar: const MainAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: UiConstants.horizontalScreenPadding),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                //   filterQuality: FilterQuality.high,
                image: AssetImage(
                    '${Strings.assetImages}app_background_main.png'))),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                // Text('Home Screen'),
                // ElevatedButton(
                //   onPressed: () => ref
                //       .read(
                //         rootNavigatorKeyProvider.notifier,
                //       )
                //       .navigateToFoodDetail(),
                //   child: const Text('Navigate to Food Navigator'),
                // ),
                SizedBox(height: 42),
                CategorySection(),
                RecentlyOrderedSection(),
                TopPicksSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
