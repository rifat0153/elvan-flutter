import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: authState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        unKnown: () => const Center(child: Text('Unknown')),
        unAuthenticated: () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailTextController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: passwordTextController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                authNotifier.onEvent(
                  AuthEvent.loginWithPasswordAndEmail(
                    email: emailTextController.value.text,
                    password: passwordTextController.value.text,
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
        authenticated: (elvanUser) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Authenticated: ${elvanUser.createdAt}'),
            ElevatedButton(
              onPressed: () {
                authNotifier.onEvent(const AuthEvent.isLogginOut());
              },
              child: const Text('Logout'),
            ),
          ],
        ),
        error: (message) => Center(child: Text('Error: $message')),
      ),
    );
  }
}
