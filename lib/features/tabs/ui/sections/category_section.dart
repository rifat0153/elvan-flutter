import 'package:elvan/shared/components/cards/category_items_card.dart';
import 'package:elvan/features/tabs/ui/screens/components/category_section_header.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:elvan/shared/components/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: UiConstants.sectionBottomMargin),
      width: double.infinity,
      color: Colors.transparent,
      child: Column(children: [
        const CategorySectionHeader(),
        const SizedBox(height: UiConstants.headerToCardSpacing),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
                  5,
                  (index) => const CategoryItemsCard(
                        categoryName: 'Pizza',
                        imageUrl: '${Strings.assetImages}pizza_slice.png',
                      ))),
        )
      ]),
    );
  }
}
