import 'package:beamer/beamer.dart';
import 'package:elvan/core/beamer/locations/favorite_locations.dart';
import 'package:elvan/core/beamer/locations/home_locations.dart';
import 'package:elvan/core/beamer/locations/profile_locations.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late int _currentIndex;

  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/home',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/home')) {
          return HomeLocations(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/favorite',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/favorite')) {
          return FavoriteLocations(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/profile',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/profile')) {
          return ProfileLocations(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   _currentIndex = widget.initialIndex;
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;

    print('uriString: $uriString');

    if (uriString.contains('home')) {
      _currentIndex = 0;
    } else if (uriString.contains('favorite')) {
      _currentIndex = 1;
    } else if (uriString.contains('profile')) {
      _currentIndex = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        // backgroundColor: const Color(AppColors.primaryColor),
        // surfaceTintColor: Colors.black,
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          if (index != _currentIndex) {
            setState(() => _currentIndex = index);
            _routerDelegates[_currentIndex].update(rebuild: false);
          }
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            label: 'Settings',
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person),
          ),
        ],
      ),
      // body: widget.child,
      body: ScreenBackground(
        imagePath: AppAsset.homeBackgroundPng,
        child: IndexedStack(
          index: _currentIndex,
          children: [
            // use Beamer widgets as children
            Beamer(
              routerDelegate: _routerDelegates[0],
            ),
            Beamer(
              routerDelegate: _routerDelegates[1],
            ),
            Beamer(
              routerDelegate: _routerDelegates[2],
            ),
          ],
        ),
      ),
    );
  }
}
