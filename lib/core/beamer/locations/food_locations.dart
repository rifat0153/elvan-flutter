import 'package:beamer/beamer.dart';
import 'package:elvan/features/food/ui/food_detail/screens/food_detail_screen.dart';
import 'package:elvan/features/food/ui/food_list/screens/food_list_screen.dart';
import 'package:flutter/material.dart';

class FoodLocations extends BeamLocation<BeamState> {
  FoodLocations(RouteInformation state) : super(state);

  @override
  List<Pattern> get pathPatterns => ['/food/:foodId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('food'),
          title: 'Food List',
          type: BeamPageType.noTransition,
          child: FoodListScreen(),
        ),
        if (state.pathParameters.containsKey('foodId'))
          BeamPage(
            key: ValueKey('food-${state.pathParameters['foodId']}'),
            title: 'Food Details',
            child: const FooDDetailScreen(),
          ),
      ];
}
