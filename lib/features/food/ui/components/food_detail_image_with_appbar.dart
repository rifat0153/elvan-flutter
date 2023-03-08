import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';

import 'package:elvan/core/extensions/build_context/screen_size_ext.dart';
import 'package:elvan/features/food/ui/components/food_detail_appbar.dart';
import 'package:elvan/features/food/ui/components/food_detail_image.dart';

class FoodDetailImageWithAppbar extends StatelessWidget {
  const FoodDetailImageWithAppbar(
      {super.key, required this.foodItem, this.isSaladBar = false});

  final FoodItem foodItem;
  final bool isSaladBar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeightPercent(isSaladBar ? 0.3 : 0.4),
      width: context.screenWidthPercent(1),
      child: Stack(
        children: [
          Positioned.fill(
            child: FoodDetailImage(
              foodItem: foodItem,
            ),
          ),
          const FoodDetailAppBar(),
        ],
      ),
    );
  }
}
