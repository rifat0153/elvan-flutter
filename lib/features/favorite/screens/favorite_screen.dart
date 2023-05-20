import 'package:elvan/core/extensions/build_context/screen_size_ext.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan/features/favorite/notifer/favorite_provider.dart';
import 'package:elvan/features/food/ui/components/food_list_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(favoriteProvider);

    return Column(
      children: [
        Builder(builder: (context) {
          if (favorite.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: context.screenHeight / 3.2),
                  child: Text(
                    AppLocalizations.of(context)?.addFavorite ?? "Add your favorite",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            );
          }
          return Padding(
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
          );
        }),
      ],
    );
  }
}
