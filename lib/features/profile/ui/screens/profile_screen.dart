import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body:  Center(
        child: Column(
          children: [
            const Text('Profile'),
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).onEvent(
                      const AuthEvent.logout(),
                    );
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
