import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/features/food/ui/top_picks/screens/top_pick_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_size.dart';

class TopPicksGrid extends StatelessWidget {
  const TopPicksGrid({super.key, required this.foodItems});

  final Iterable<FoodItem> foodItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSize.paddingMD),
        _topPicksTitle(context),
        GridView.builder(
          padding: const EdgeInsets.all(AppSize.paddingMD),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: AppSize.paddingSM,
            mainAxisSpacing: AppSize.paddingSM,
          ),
          shrinkWrap: true,
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final foodItem = foodItems.elementAt(index);

            return TopPickCard(foodItem: foodItem);
          },
        ),
      ],
    );
  }

  Widget _topPicksTitle(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: AppSize.paddingMD),
        AppText(
          AppLocalizations.of(context)!.topPicksListTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(),
        AppText(
          AppLocalizations.of(context)!.viewAll,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(width: AppSize.paddingMD),
      ],
    );
  }
}
