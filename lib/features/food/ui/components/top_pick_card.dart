import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elvan/features/favorite/notifer/favorite_provider.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/shared/components/buttons/elvan_icon_button.dart';
import 'package:elvan/shared/components/buttons/favorite_button.dart';
import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/food/ui/notifier/selected_food_provider.dart';

class TopPickCard extends ConsumerWidget {
  const TopPickCard({super.key, required this.foodItem});

  final FoodItem foodItem;

  static final double imageOffset = -48.w;
  static final double imageRadius = 64.w;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFoodItemNotifier = ref.read(selectedFoodItemNotifierProvider.notifier);
    return InkWell(
      onTap: () {
        selectedFoodItemNotifier.setFoodItemAndBuildSteps(foodItem);
        context.pushRoute(
          const FoodRouter(children: [
            FoodListRoute(),
            FoodDetailRoute(),
          ]),
        );
      },
      child: BaseCard(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 110.spMin,
                child: Stack(
                  children: [
                    Positioned(
                      top: imageOffset,
                      left: imageOffset,
                      // child: Hero(
                      //   tag: foodItem.id ?? '',
                      //   child: CachedNetworkImage(
                      //     imageUrl: foodItem.imageUrl!,
                      //     fit: BoxFit.cover,
                      //     width: imageRadius * 2,
                      //     height: imageRadius * 2,
                      //     placeholder: (context, url) => const CircularProgressIndicator(
                      //       color: AppColors.primaryRed,
                      //     ),
                      //     errorWidget: (context, url, error) => const Icon(Icons.error),
                      //   ),

                      child: CircleAvatar(
                        radius: imageRadius,
                        backgroundImage: CachedNetworkImageProvider(foodItem.imageUrl!),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Consumer(
                        builder: (BuildContext context, WidgetRef ref, Widget? child) {
                          final _ = ref.watch(favoriteProvider);
                          final favProviderNotifier = ref.read(favoriteProvider.notifier);
                          return FavoriteButton(
                            isFavorite: favProviderNotifier.isFavorite(foodItem),
                            foodItem: foodItem,
                            onPressed: () {
                              favProviderNotifier.toggle(foodItem);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingSM),
                child: AppText(
                  foodItem.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingSM),
                child: AppText(
                  foodItem.description ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 3,
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: AppSize.paddingSM),
                  AppText(
                    foodItem.price.toString(),
                    color: AppColors.primaryRed,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  ElvanIconButton(
                    icon: Icons.add,
                    color: AppColors.primaryRed,
                    onPressed: () {
                      selectedFoodItemNotifier.setFoodItemAndBuildSteps(foodItem);
                      context.pushRoute(
                        const FoodRouter(children: [
                          FoodDetailRoute(),
                        ]),
                      );
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
