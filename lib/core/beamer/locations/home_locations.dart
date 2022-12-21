import 'package:beamer/beamer.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class HomeLocations extends BeamLocation<BeamState> {
  HomeLocations(RouteInformation state) : super(state);

  @override
  List<Pattern> get pathPatterns => ['/home'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        type: BeamPageType.noTransition,
        child: HomeScreen(),
      ),
    ];
  }
}
