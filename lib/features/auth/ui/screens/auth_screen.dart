import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/features/auth/ui/state/auth_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  final state = const AuthScreenState.unKnown();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authNotifierProvider.notifier);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      unKnown: () => Center(
          child: GestureDetector(
        onTap: () {
          authNotifier.onEvent(const AuthEvent.resetPassword(email: 'email'));
        },
        child: Text('Reset'),
      )),
      authenticated: (elvanUser) => Center(child: Text('Authenticated: ${elvanUser.email}')),
      unAuthenticated: () => Center(child: Text('UnAuthenticated')),
      error: (message) => Center(child: Text('Error: $message')),
    );
  }
}
