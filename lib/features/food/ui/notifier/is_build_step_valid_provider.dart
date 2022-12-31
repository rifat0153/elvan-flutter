import 'package:elvan/features/food/ui/notifier/build_steps_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isBuildStepsValidProvider = NotifierProvider<IsBuildStepsValidNotifier, bool>(
  IsBuildStepsValidNotifier.new,
);

class IsBuildStepsValidNotifier extends Notifier<bool> {
  @override
  build() {
    final buildStepsAsyncValue = ref.watch(buildStepsNotifierProvider);

    return buildStepsAsyncValue.maybeWhen(
      data: (buildSteps) {
        return buildSteps.every((e) => e.isAddOnsValid);
      },
      orElse: () => false,
    );
  }
}
