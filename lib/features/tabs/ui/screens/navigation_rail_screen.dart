import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationRailScreen extends HookConsumerWidget {
  const NavigationRailScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            onDestinationSelected: (val) => _onItemTapped(val, context),
            selectedIndex: _calculateSelectedIndex(context),
            destinations: const [
              NavigationRailDestination(
                label: Text('Home'),
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
              ),
              NavigationRailDestination(
                label: Text('Favorites'),
                icon: Icon(Icons.favorite),
                selectedIcon: Icon(Icons.favorite),
              ),
              NavigationRailDestination(
                label: Text('Person'),
                icon: Icon(Icons.person),
                selectedIcon: Icon(Icons.person),
              ),
            ],
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    const String location = '';

    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/favorite')) {
      return 1;
    }
    if (location.startsWith('/profile')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }
}
