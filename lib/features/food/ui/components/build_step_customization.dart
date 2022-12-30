import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/category/domain/models/add_on/add_on.dart';
import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:elvan/shared/components/buttons/elvan_icon_button.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';

class BuildStepCustomization extends HookConsumerWidget {
  const BuildStepCustomization({
    super.key,
    required this.buildStep,
  });

  final BuildStep buildStep;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buildStepsNotifier = ref.watch(buildStepsNotifierProvider.notifier);

    final addOns = buildStep.addOns;

    return Column(
      children: [
        _buildSectionTitle(context, buildStep),
        ...addOns
            .map(
              (addOn) => _buildAddOnTile(
                context,
                addOn,
                () {
                  buildStepsNotifier.updateAddOnQuantity(
                    buildStepId: buildStep.id ?? '',
                    addOnId: addOn.id ?? '',
                    action: AddOnQuantityAction.toggleIsSelected,
                  );
                },
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildAddOnTile(BuildContext context, AddOn addOn, Function() onPressed) {
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
            // TODO: Add on pressed
            onPressed: () {
              onPressed();
            },
          ),
          Expanded(
            child: AppText(
              addOn.title,
              style: Theme.of(context).textTheme.titleMedium,
              color: AppColors.grey,
            ),
          ),
          AppText(
            '\$${addOn.price}',
            style: Theme.of(context).textTheme.titleMedium,
            color: AppColors.grey,
          )
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, BuildStep buildStep) {
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
            'Choose ${buildStep.selectedAddOnsCount}/${buildStep.noOfItemIncludedInPrice}',
            style: Theme.of(context).textTheme.titleSmall,
            color: AppColors.grey,
            letterSpacing: 0.8,
          ),
          AppText(
            'Included in price ${buildStep.noOfItemIncludedInPrice}',
            style: Theme.of(context).textTheme.titleSmall,
            color: AppColors.grey,
            letterSpacing: 0.8,
          ),
          AppText(
            'Min${buildStep.minSelectedAddOns} Max${buildStep.maxSelectedAddOns}',
            style: Theme.of(context).textTheme.titleSmall,
            color: AppColors.grey,
            letterSpacing: 0.8,
          ),
          AppText(
            'Selected Count${buildStep.selectedAddOnsCount}',
            style: Theme.of(context).textTheme.titleSmall,
            color: AppColors.grey,
            letterSpacing: 0.8,
          ),
          AppText(
            'Should add price ${buildStep.shouldAddPriceToTotal}',
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
