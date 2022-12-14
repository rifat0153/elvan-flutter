import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/app/router/app_router.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final isAuthenticated = ref.read(
      authNotifierProvider.notifier.select((v) => v.isAuthenticated),
    );

    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    final currentRoute = ref.read(appRouterProvider).current.path;

    return Scaffold(
      appBar: AppBar(
        title: Text('Auth $isAuthenticated '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Auth Screen'),
          Text('Current Route --> $currentRoute'),
          authState.when(
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
                  onPressed: () async {
                    authNotifier.onEvent(
                      const AuthEvent.loginWithPasswordAndEmail(
                        email: 'elvan@gmail.com',
                        password: '123456',
                        // email: emailTextController.value.text,
                        // password: passwordTextController.value.text,
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
            authenticated: (elvanUser) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Authenticated: ${elvanUser.email}'),
                  ElevatedButton(
                    onPressed: () {
                      authNotifier.onEvent(const AuthEvent.logout());
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
            error: (message) => Center(child: Text('Error: $message')),
          ),
        ],
      ),
    );
  }
}
