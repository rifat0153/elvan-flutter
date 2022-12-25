import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Useful to log state change in our application
/// Read the logs and you'll better understand what's going on under the hood
class StateLogger extends ProviderObserver {
  const StateLogger();
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // TODO use a proper logger
    logInfo(
      'Provider: ${provider.name ?? provider.runtimeType} changed',
    );
    // logWarning(
    //   'Provider: ${provider.name} changed from ${previousValue.toString()} to ${newValue.toString()}',
    // );
//     print('''
// Provider: ${provider.name ?? provider.runtimeType}
//   provider: ${provider.name ?? provider.runtimeType},
//   oldValue: $previousValue,
//   newValue: $newValue
// }
// ''');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}
