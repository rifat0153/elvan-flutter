import 'dart:math';

import 'package:elvan/shared/components/cards/base_card.dart';
import 'package:elvan_shared/dtos/category/add_on/add_on.dart';
import 'package:elvan_shared/dtos/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:elvan/shared/components/buttons/elvan_icon_button.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';

class BuildStepCustomization extends HookConsumerWidget {
  const BuildStepCustomization({
    super.key,
    required this.buildStep,
    required this.isSaladBar,
  });

  final BuildStep buildStep;
  final bool isSaladBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buildStepsNotifier = ref.watch(buildStepsNotifierProvider.notifier);

    final addOns = buildStep.addOns;

    return Column(
      children: [
        _buildSectionTitle(context, buildStep),
        if (isSaladBar) ...[
          _buildSalad(context, buildStep, addOns, buildStepsNotifier),
        ] else ...[
          ...addOns
              .map(
                (addOn) => _buildAddOnTile(
                  context,
                  addOn,
                  () {
                    buildStepsNotifier.toggleAddOnIsSelectedState(
                      buildStepId: buildStep.id ?? '',
                      addOnId: addOn.id ?? '',
                    );
                  },
                ),
              )
              .toList(),
        ]
      ],
    );
  }

  Widget _buildSalad(BuildContext context, BuildStep buildStep,
      List<AddOn> addOns, BuildStepsNotifier buildStepsNotifier) {
    return LayoutGrid(
      columnSizes: [
        1.fr,
        1.fr,
        1.fr,
      ],
      rowSizes: List.generate(((addOns.length - 1) ~/ 2 + 1), (index) => auto)
          .toList(),
      rowGap: AppSize.paddingMD,
      children: addOns
          .map(
            (addOn) => _buildSaladAddon(
              context,
              addOn,
              () {
                buildStepsNotifier.toggleAddOnIsSelectedState(
                  buildStepId: buildStep.id ?? '',
                  addOnId: addOn.id ?? '',
                );
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildSaladAddon(
    BuildContext context,
    AddOn addOn,
    Function() onPressed,
  ) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingSM,
          vertical: AppSize.paddingXS,
        ),
        child: BaseCard(
            child: Column(
          //image and title
          children: [
            //salad image
            Container(
              height: 105,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(addOn.imageUrl ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            //title
            Row(
              children: [
                Expanded(
                  child: AppText(
                    addOn.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleMedium,
                    color: AppColors.grey,
                  ),
                ),

                //add button
                ElvanIconButton(
                  icon: addOn.isSelected
                      ? Icons.remove_circle_outline
                      : Icons.add_circle,
                  color: isSaladBar ? AppColors.green : AppColors.primaryRed,
                  onPressed: onPressed,
                ),
              ],
            ),
          ],
        ))

        // Row(
        //   children: [
        //     ElvanIconButton(
        //       icon: Icons.add,
        //       color: AppColors.primaryRed,
        //       onPressed: () {},
        //     ),
        //     Expanded(
        //       child: AppText(
        //         'Salad',
        //         style: Theme.of(context).textTheme.titleMedium,
        //         color: AppColors.grey,
        //       ),
        //     ),
        //     _itemPrice(addOn, context)
        //   ],
        // ),
        );
  }

  Widget _buildAddOnTile(
      BuildContext context, AddOn addOn, Function() onPressed,
      {bool isSaladBar = false}) {
    if (isSaladBar) {
      return _buildSaladAddon(
        context,
        addOn,
        onPressed,
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.paddingMD,
        vertical: AppSize.paddingXS,
      ),
      child: Row(
        children: [
          ElvanIconButton(
            icon: addOn.isSelected ? Icons.check_circle_outline : Icons.add,
            color: AppColors.primaryRed,
            onPressed: onPressed,
          ),
          Expanded(
            child: AppText(
              addOn.title,
              style: Theme.of(context).textTheme.titleMedium,
              color: AppColors.grey,
            ),
          ),
          _itemPrice(addOn, context)
        ],
      ),
    );
  }

  AppText _itemPrice(AddOn addOn, BuildContext context) {
    final priceText = !addOn.includeInPrice && addOn.isSelected
        ? 'Included'
        : '\$${addOn.price}';

    return AppText(
      priceText,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
          // decoration: !addOn.includeInPrice && addOn.isSelected ? TextDecoration.lineThrough : TextDecoration.none,
          ),
      color: AppColors.grey,
    );
  }

  Widget _buildSectionTitle(BuildContext context, BuildStep buildStep) {
    final itemsIncludedInPrice =
        max(buildStep.noOfItemIncludedInPrice, buildStep.minSelectedAddOns);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.paddingMD,
        vertical: AppSize.paddingXS,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  buildStep.title.toUpperCase(),
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  color: AppColors.white,
                ),
              ),
              AppText(
                buildStep.isRequired ? 'Required' : 'Optional',
              )
            ],
          ),
          AppText(
            'Choose ${buildStep.selectedAddOnsCount}/$itemsIncludedInPrice',
            style: Theme.of(context).textTheme.titleSmall,
            color: AppColors.grey,
            letterSpacing: 0.8,
          ),
          Visibility(
            visible: buildStep.error != null,
            child: AppText(
              buildStep.error ?? '',
              color: AppColors.errorTextColor,
            ),
          )
        ],
      ),
    );
  }
}
