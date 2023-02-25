import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:elvan/features/order/ui/recent_order/screens/recent_order_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class RecentOrdersRow extends StatelessWidget {
  const RecentOrdersRow({super.key, required this.cartItems});

  final Iterable<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSize.padding2XL),
        _recentOrdersTitle(context),
        Padding(
          padding: const EdgeInsets.all(AppSize.paddingMD),
          child:

              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       const SizedBox(width: AppSize.paddingMD),
              //       for (final order in cartItems) ...[
              //         RecentOrderCard(
              //           cartItem: order,
              //         ),
              //         const SizedBox(
              //           width: AppSize.paddingMD,
              //         ),
              //       ],
              //     ],
              //   ),
              // )

              LayoutGrid(
            // each column is 1/2 of the available width
            columnSizes: [
              1.fr,
              1.fr,
            ],
            // each row is taking as much space as its content
            rowSizes: List.generate(
                ((cartItems.length - 1) ~/ 2) + 1, (index) => auto).toList(),
            columnGap: AppSize.paddingMD,
            rowGap: AppSize.paddingMD,
            children: [
              for (final order in cartItems)
                RecentOrderCard(
                  cartItem: order,
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
