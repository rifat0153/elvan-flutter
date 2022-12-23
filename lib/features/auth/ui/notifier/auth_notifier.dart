import 'dart:async';

import 'package:elvan/features/auth/domain/usecase/auth_usecases.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/features/auth/ui/state/auth_screen_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthScreenState>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthScreenState> {
  AuthNotifier() : super();

  late final AuthUseCases authUseCase;
  late final StreamSubscription<User?> authStateChangesSubscription;

  bool get isAuthenticated => state.maybeWhen(
        authenticated: (elvanUser) => true,
        orElse: () => false,
      );

  @override
  build() {
    // setup (just like widget initState)
    authUseCase = ref.read(authUseCaseProvider);
    authStateChangesSubscription = authUseCase.getUserStreamUseCase().listen(
          handleUserStream,
        );

    // dispose (just like widget dispose)
    // cancel all subscriptions and close all streams
    ref.onDispose(() {
      authStateChangesSubscription.cancel();
    });

    // return the initial state of the notifier
    return const AuthScreenState.unAuthenticated();
  }

  void handleUserStream(User? user) {
    debugPrint('Auth Stream: ${user?.uid}');

    if (user != null) {
      getElvanUserData(user.uid);
    }
  }

  void onEvent(AuthEvent event) {
    // use pattern matching to handle events
    event.when(
      // loginWithPasswordAndEmail: login,
      loginWithPasswordAndEmail: loginAndGetUserData,
      logout: () {
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

  Future getElvanUserData(String userID) async {
    final result = await authUseCase.getUserUseCase(userId: userID);

    result.when(
      success: (elvanUser) {
        state = AuthScreenState.authenticated(elvanUser);
      },
      failure: (failure) {
        state = const AuthScreenState.unAuthenticated();
      },
    );
  }

  Future loginAndGetUserData(String email, String password) async {
    state = const AuthScreenState.loading();

    final result = await authUseCase.signInWithEmailAndPasswordAndGetElvanUserUseCase(
      email: email,
      password: password,
    );

    result.when(
      success: (elvanUser) {
        state = AuthScreenState.authenticated(elvanUser);
      },
      failure: (message) {
        state = AuthScreenState.error(message.toString());
      },
    );

    debugPrint('Login with email and password: $email, $password');
  }
}
