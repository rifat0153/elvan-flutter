import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestListPage extends ConsumerWidget {
  const TestListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test List Route'),
            ElevatedButton(
              onPressed: () {
                context.go('/b/details');
              },
              child: const Text('Navigate to Test Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
