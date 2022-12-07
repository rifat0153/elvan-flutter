import 'package:elvan/shared/components/cards/recently_ordered_items_card.dart';
import 'package:elvan/features/tabs/ui/screens/components/recently_ordered_section_header.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:elvan/shared/components/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecentlyOrderedSection extends StatelessWidget {
  const RecentlyOrderedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: UiConstants.sectionBottomMargin),
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      color: Colors.transparent,
      child: Column(children: [
        const RecentlyOrderedSectionHeader(),
        const SizedBox(height: UiConstants.headerToCardSpacing),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
                  5,
                  (index) => const RecentlyOrderedItemsCard(
                        foodName: 'Pizza',
                        qty: 2,
                        price: 199,
                        imageUrl: '${Strings.assetImages}pizza.png',
                      ))),
        )
      ]),
    );
  }
}
