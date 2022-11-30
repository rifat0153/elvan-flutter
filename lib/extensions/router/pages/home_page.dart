import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = useState(0);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Route'),
            Text('Count: ${count.value}'),
            ElevatedButton(
              onPressed: () {
                count.value++;
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/a/details');
              },
              child: const Text('Go to Test List'),
            ),
          ],
        ),
      ),
    );
  }
}
