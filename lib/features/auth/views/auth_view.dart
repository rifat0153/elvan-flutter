import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthView extends HookConsumerWidget {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateNotifierProvider);

    final textContrller = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: authState.when(
            loggedIn: (user) {
              return Column(
                children: [
                  Text('Welcome ${user}'),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authStateNotifierProvider.notifier).signOut();
                    },
                    child: const Text('Sign out'),
                  ),
                ],
              );
            },
            signedOut: () {
              return ElevatedButton(
                onPressed: () {
                  ref.read(authStateNotifierProvider.notifier).signInAnyonymously();
                },
                child: const Text('Please sign in'),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            error: (error) {
              return Text('Error: $error');
            },
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       child: authState.when(
    //         loggedIn: (user) {
    //           return Column(
    //             children: [
    //               Text('Welcome ${user}'),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   ref.read(authStateNotifierProvider.notifier).signOut();
    //                 },
    //                 child: const Text('Sign out'),
    //               ),
    //             ],
    //           );
    //         },
    //         signedOut: () {
    //           return ElevatedButton(
    //             onPressed: () {
    //               ref.read(authStateNotifierProvider.notifier).signInAnyonymously();
    //             },
    //             child: const Text('Please sign in'),
    //           );
    //         },
    //         loading: () {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         },
    //         error: (error) {
    //           return Text('Error: $error');
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
