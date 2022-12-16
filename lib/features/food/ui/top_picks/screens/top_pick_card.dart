import 'package:elvan/features/food/domain/models/food_item/food_item.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPickCard extends HookConsumerWidget {
  const TopPickCard({super.key, required this.foodItem});

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseCard(
      child: Stack(
        children: [
          AppText(
            foodItem.title,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
