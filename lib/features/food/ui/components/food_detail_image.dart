import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:elvan/shared/components/image/elvan_network_image.dart';

class FoodDetailImage extends StatelessWidget {
  const FoodDetailImage({super.key, required this.foodItem});

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return ElvanNetworkImage(
      foodItem.imageUrl ?? '',
      foodItem.id ?? '',
      fit: BoxFit.cover,
    );
  }
}
