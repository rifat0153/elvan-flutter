import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentBuildStepsPriceProvider = NotifierProvider<CurrentBuildStepsNotifier, double>(
  CurrentBuildStepsNotifier.new,
);

class CurrentBuildStepsNotifier extends Notifier<double> {
  @override
  build() {
    final buildStepsAsyncValue = ref.watch(buildStepsNotifierProvider);

    final double price = buildStepsAsyncValue.maybeWhen(
      data: (buildSteps) {
        return buildSteps.fold(
          0,
          (previousValue, bs) {
            return previousValue + bs.price;
          },
        );
      },
      orElse: () => 0,
    );

    return price;
  }
}
