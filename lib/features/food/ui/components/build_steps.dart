import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuildStepsWidget extends HookConsumerWidget {
  const BuildStepsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buildSteps = ref.watch(buildStepsNotifierProvider);

    return buildSteps.when(
      data: (buildSteps) {
        return Column(
          children: [
            for (final buildStep in buildSteps)
              Column(
                children: [
                  Text(buildStep.title),
                  for (final addOn in buildStep.addOns)
                    Column(
                      children: [
                        Text(addOn.title),
                        Text(addOn.quantitySelected.toString()),
                      ],
                    ),
                ],
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const Center(child: Text('Error')),
    );
  }
}
