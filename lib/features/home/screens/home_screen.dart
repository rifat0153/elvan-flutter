import 'package:elvan/navigation/provider/root_navigator_key.dart';
import 'package:elvan/navigation/navigators/root_navigator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Screen'),
          ElevatedButton(
            onPressed: () => ref.read(rootNavigatorKeyProvider.notifier).navigateToFoodDetail(),
            // onPressed: () => Navigator.of(context).pushNamed(routeFoodStart),
            child: const Text('Navigate to Food Navigator'),
          ),
        ],
      ),
    );
  }
}
