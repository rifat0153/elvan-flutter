import 'dart:async';

import 'package:elvan/features/auth/domain/usecase/auth_usecases.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/features/auth/ui/state/auth_screen_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthScreenState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthScreenState> {
  AuthNotifier() : super();

  late final AuthUseCases authUseCase;
  late final StreamSubscription<User?> authStateChangesSubscription;

  @override
  build() {
    // setup (just like widget initState)
    authUseCase = ref.read(authUseCaseProvider);
    authStateChangesSubscription = authUseCase.getUserStreamUseCase().listen(handleUserStream);

    // dispose (just like widget dispose)
    // cancel all subscriptions and close all streams
    ref.onDispose(() {
      authStateChangesSubscription.cancel();
    });

    return const AuthScreenState.unAuthenticated();
  }

  void handleUserStream(User? user) {
    debugPrint('Auth Stream: $user');
  }

  void onEvent(AuthEvent event) {
    // use pattern matching to handle events
    event.when(
      loginWithPasswordAndEmail: (email, password) async {
        state = const AuthScreenState.loading();

        final result = await authUseCase.signInWithEmailAndPasswordAndGetElvanUserUseCase(
          email: email,
          password: password,
        );

        result.when(
          data: (elvanUser) {
            state = AuthScreenState.authenticated(elvanUser);
          },
          error: (message) {
            state = AuthScreenState.error(message.toString());
          },
        );

        debugPrint('Login with email and password: $email, $password');
      },
      isLogginOut: () {
        state = const AuthScreenState.loading();
        authUseCase.signOutUseCase();
        state = const AuthScreenState.unAuthenticated();
      },
      registerWithEmailAndPassword: (email, password) {
        state = const AuthScreenState.loading();
        final result = authUseCase.signInWithEmailAndPasswordUseCase(email: email, password: password);
      },
      resetPassword: (email) {},
      goToRegisterScreen: () {
        state = const AuthScreenState.loading();
      },
    );
  }
}
