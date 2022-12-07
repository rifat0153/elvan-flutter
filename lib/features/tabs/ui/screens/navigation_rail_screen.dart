import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final String location = GoRouterState.of(context).location;

    if (location.startsWith('/tab/home')) {
      return 0;
    }
    if (location.startsWith('/tab/favorite')) {
      return 1;
    }
    if (location.startsWith('/tab/profile')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/tab/home');
        break;
      case 1:
        GoRouter.of(context).go('/tab/favorite');
        break;
      case 2:
        GoRouter.of(context).go('/tab/profile');
        break;
    }
  }
}
