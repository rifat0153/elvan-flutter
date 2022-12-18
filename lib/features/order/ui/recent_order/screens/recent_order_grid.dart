import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'package:elvan/features/order/domain/models/order.dart';
import 'package:elvan/features/order/ui/recent_order/screens/recent_order_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_size.dart';

class RecentOrdersGrid extends StatelessWidget {
  const RecentOrdersGrid({super.key, required this.orders});

  final Iterable<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: AppSize.paddingMD),
        _recentOrdersTitle(context),
        Padding(
          padding: const EdgeInsets.all(AppSize.paddingMD),
          child: LayoutGrid(
            columnSizes: [
              1.fr,
              1.fr,
            ],
            // TODO: Add rowSizes to make the grid responsive
            rowSizes: const [
              auto,
              auto,
            ],
            columnGap: AppSize.paddingMD,
            rowGap: AppSize.paddingXL,
            children: [
              for (final order in orders)
                RecentOrderCard(
                  order: order,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recentOrdersTitle(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: AppSize.paddingMD),
        AppText(
          AppLocalizations.of(context)!.recentOrdersListTitle,
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
