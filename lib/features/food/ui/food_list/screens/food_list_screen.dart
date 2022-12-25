import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/food/ui/food_list/notifier/food_list_notifier.dart';
import 'package:elvan/features/food/ui/food_list/screens/widgets/food_sliver_list.dart';
import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';

class FoodListScreen extends HookConsumerWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodListMapAsync = ref.watch(foodByCategoryNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          imagePath: AppAsset.homeBackgroundPng,
          width: 1.sw,
          height: 1.sh,
          child: foodListMapAsync.when(
            data: (foodMap) {
              return CustomScrollView(
                slivers: [
                  for (final foodEntry in foodMap.entries) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSize.paddingMD),
                        child: AppText(
                          foodEntry.key.toUpperCase(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    FoodSliverList(foodItems: foodEntry.value)
                  ]
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Text(error.toString()),
          ),
        ),
      ),
    );
  }
}



// Column(
//           children: [
//             const AppText('Food List Screen'),
//             ElevatedButton(
//               child: const AppText(
//                 'Go to Detail',
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 print('Go to detail');

//                 context.navigateTo(const FooDDetailRoute());
//                 // context.pushRoute(const FooDDetailRoute());
//               },
//             ),
//             ElevatedButton(
//               child: const AppText(
//                 'Go to Back',
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 print('Go to Back');
//                 context.popRoute();
//               },
//             ),
//           ],
//         )