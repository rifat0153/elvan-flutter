import 'package:beamer/beamer.dart';
import 'package:elvan/core/beamer/locations/food_locations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodScreen extends HookConsumerWidget {
  const FoodScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foodRouterDelegate = BeamerDelegate(
      initialPath: '/food',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/food')) {
          return FoodLocations(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    );

    return Beamer(
      routerDelegate: foodRouterDelegate,
    );
  }
}
