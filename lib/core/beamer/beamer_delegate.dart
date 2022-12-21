import 'package:beamer/beamer.dart';
import 'package:elvan/features/food/ui/food_screen.dart';
import 'package:elvan/features/tabs/ui/screens/tab_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final beamerDelegateProvider = Provider<BeamerDelegate>((ref) {
  return BeamerDelegate(
    initialPath: '/tab/home',
    routeListener: (routeInfo, delegate) {
      print('routeListener: ${routeInfo.location}');
    },
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/tab/home': (context, state, data) => const TabScreen(),
        '/food': (context, state, data) => const FoodScreen(),
        '/food/:foodId': (context, state, data) => const FoodScreen(),
      },
    ),
  );
});
