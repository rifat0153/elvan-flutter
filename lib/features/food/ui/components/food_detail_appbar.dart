import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/shared/constants/app_colors.dart';

class FoodDetailAppBar extends StatelessWidget {
  const FoodDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            // TODO: Add go to cart functionality
            onPressed: () {
              context.pushRoute(const CartRoute());
            },
          ),
        ],
      ),
    );
  }
}
