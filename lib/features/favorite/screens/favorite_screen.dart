import 'package:elvan/features/favorite/provider/favorite_provider.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../food/ui/components/food_list_card.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(favoriteProvider);

    return Column(
      children: [
        const ElvanAppBar(title: 'Favorite'),
        Padding(
          padding: const EdgeInsets.all(AppSize.kPadding * 2),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: favorite.length,
            itemBuilder: (BuildContext context, int index) {
              var foodItem = favorite[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSize.kPadding * 2),
                child: FoodListCard(
                  key: ValueKey(foodItem.id),
                  foodItem: foodItem,
                ),
              );
            },
          ),
        ),
      ],
    );
    // CustomScrollView(
    //   slivers: [
    //     SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         (context, index) => AppText(index.toString()),
    //         childCount: 10,
    //       ),
    //     ),
    //     //horizontal list
    //     SliverToBoxAdapter(
    //       child: Container(
    //         color: Colors.blue.shade200,
    //         height: 55,
    //         child: ListView.builder(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: 10,
    //             itemBuilder: (context, index) {
    //               return AppText(index.toString());
    //             }),
    //       ),
    //     ),

    //     // //grid list
    //     SliverGrid(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         mainAxisSpacing: 0,
    //         crossAxisSpacing: 0,
    //       ),
    //       delegate: SliverChildListDelegate(
    //         List.generate(10, (index) => AppText(index.toString())),
    //       ),
    //     )
    //   ],
    // );
  }
}
