import 'package:elvan/features/favorite/notifer/favorite_provider.dart';

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
        const ElvanAppBar(title: 'Favorite', showBackButton: false),
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
  }
}
