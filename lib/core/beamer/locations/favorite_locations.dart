import 'package:beamer/beamer.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class FavoriteLocations extends BeamLocation<BeamState> {
  FavoriteLocations(RouteInformation state) : super(state);

  @override
  List<Pattern> get pathPatterns => ['/favorite'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('favorite'),
        title: 'Favorite',
        type: BeamPageType.noTransition,
        child: FavoriteScreen(),
      ),
    ];
  }
}
