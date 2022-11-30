import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestDetailPage extends ConsumerWidget {
  const TestDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test Detail Route'),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Navigate to Test List'),
            ),
          ],
        ),
      ),
    );
  }
}
