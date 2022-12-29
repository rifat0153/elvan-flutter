import 'package:elvan/features/category/domain/models/build_step/build_step.dart';
import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuildStepSectionWidget extends HookConsumerWidget {
  const BuildStepSectionWidget({
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
        ...addOns
            .map(
              (e) => AppText(e.title),
            )
            .toList(),
      ],
    );
  }
}
