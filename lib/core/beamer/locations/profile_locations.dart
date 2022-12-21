import 'package:beamer/beamer.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileLocations extends BeamLocation<BeamState> {
  ProfileLocations(RouteInformation state) : super(state);

  @override
  List<Pattern> get pathPatterns => ['/profile'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('profile'),
        title: 'Profile',
        type: BeamPageType.noTransition,
        child: ProfileScreen(),
      ),
    ];
  }
}
