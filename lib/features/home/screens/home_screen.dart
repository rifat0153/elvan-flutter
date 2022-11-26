import 'package:elvan/navigation/root_navigator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          const Text('HomeView'),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed(routeFoodStart),
            child: const Text('Navigate to Food Navigator'),
          ),
        ],
      ),
    );
  }
}
