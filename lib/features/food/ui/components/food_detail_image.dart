import 'package:flutter/material.dart';

import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/shared/components/image/elvan_network_image.dart';

class FoodDetailImage extends StatelessWidget {
  const FoodDetailImage({super.key, required this.foodItem});

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return ElvanNetworkImage(
      foodItem.imageUrl ?? '',
    );
  }
}
