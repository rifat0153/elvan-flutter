import 'dart:async';

import 'package:elvan/shared/constants/app_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/features/auth/domain/usecase/auth_usecases.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/features/auth/ui/state/auth_screen_state.dart';
import 'package:elvan/shared/providers/scaffold_messenger/snackbar_provider.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthScreenState>(
  AuthNotifier.new,
);

class AuthNotifier extends Notifier<AuthScreenState> {
  AuthNotifier() : super();

  late final AuthUseCases authUseCase;
  late final StreamSubscription<User?> authStateChangesSubscription;

  bool get isAuthenticated => state.elvanUser != null ? true : false;

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
    return const AuthScreenState();
  }

  void handleUserStream(User? user) {
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
        state = state.copyWith(
          elvanUser: state.elvanUser,
          loading: true,
        );
        authUseCase.signOutUseCase();
        state = state.copyWith(
          elvanUser: null,
          loading: false,
        );
      },
      registerWithEmailAndPassword: _registration,
      resetPassword: (email, context) async {
        // state = const AuthScreenState.loading();
        state = state.copyWith(
          elvanUser: state.elvanUser,
          loading: true,
        );

        try {
          final _ = await authUseCase.resetPasswordUseCase(email: email);
          state = state.copyWith(
            elvanUser: state.elvanUser,
            loading: false,
          );

          var snakbar = ref.read(snackbarNotifierProvider.notifier);
          // ignore: use_build_context_synchronously
          snakbar.alartDialog(
              // ignore: use_build_context_synchronously
              title: AppLocalizations.of(context)?.emailSent ?? 'Email Sent',
              // ignore: use_build_context_synchronously
              content: AppLocalizations.of(context)?.resetPasswordMsg ?? 'Reset Password Email has been sent to your email address',
              onOk: () {
                snakbar.closeAlartDialog();
              },
              context: context);
          //show toast
        } catch (e) {
          // TODO: NEXT DO
        }
      },

      goToRegisterScreen: () {
        state = state.copyWith(
          elvanUser: state.elvanUser,
          loading: true,
        );
      },
    );
  }

  Future getElvanUserData(String userID) async {
    state = state.copyWith(
      elvanUser: state.elvanUser,
      loading: true,
    );
    final result = await authUseCase.getUserUseCase(userId: userID);

    result.when(
      success: (elvanUser) {
        state = state.copyWith(
          elvanUser: elvanUser,
          loading: false,
        );
      },
      failure: (failure) {
        state = state.copyWith(
          elvanUser: state.elvanUser,
          loading: false,
        );
        ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(failure.message ?? '');
      },
    );
  }

  Future loginAndGetUserData(String email, String password) async {
    state = state.copyWith(elvanUser: null, loading: true);

    final result = await authUseCase.signInWithEmailAndPasswordAndGetElvanUserUseCase(
      email: email,
      password: password,
    );

    result.when(
      success: (elvanUser) {
        state = state.copyWith(
          elvanUser: elvanUser,
          loading: false,
        );
      },
      failure: (message) {
        // state = AuthScreenState.error(message.toString());
        state = state.copyWith(elvanUser: null, loading: false);
        ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(
              message.message ?? '',
            );
      },
    );
  }

  //set user data
  Future<void> setElvanUserData(String userID, String email) async {
    state = state.copyWith(elvanUser: state.elvanUser, loading: true);

    final result = await authUseCase.setUserUseCase(
      userId: "userId",
      elvanUser: ElvanUser(
        email: email,
      ),
    );

    result.when(
      success: (elvanUser) {
        state = state.copyWith(
          elvanUser: elvanUser,
          loading: false,
        );
      },
      failure: (failure) {
        state = state.copyWith(
          elvanUser: state.elvanUser,
          loading: false,
        );
        ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(failure.message ?? '');
      },
    );
  }

  Future? _registration(
    BuildContext context,
    String email,
    String username,
    String phone,
    String password,
  ) async {
    state = state.copyWith(
      elvanUser: state.elvanUser,
      loading: true,
    );

    if (!_validation(
      context,
      email,
      username,
      phone,
      password,
    )) {
      return;
    }

    final result = await authUseCase.signUpWithEmailAndPasswordAndGetElvanUserUseCase(
      email: email,
      password: password,
      phone: phone,
      username: username,
    );

    result.when(
      success: (data) {
        state = state.copyWith(
          elvanUser: data,
          loading: false,
        );
      },
      failure: (failure) {
        state = state.copyWith(
          elvanUser: state.elvanUser,
          loading: false,
        );
        ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(failure.message ?? '');
      },
    );
  }

  bool _validation(
    BuildContext context,
    String email,
    String username,
    String phone,
    String password,
  ) {
    final emailRegExp = RegExp(AppValidation.emailpattern);

    if (username.isEmpty) {
      state = state.copyWith(
        elvanUser: state.elvanUser,
        loading: false,
      );
      ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(AppLocalizations.of(context)?.usernameEmpty ?? '');
      return false;
    } else if (email.isEmpty) {
      state = state.copyWith(
        elvanUser: state.elvanUser,
        loading: false,
      );

      ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(AppLocalizations.of(context)?.emailEmpty ?? '');
      return false;
    } else if (!emailRegExp.hasMatch(email)) {
      state = state.copyWith(
        elvanUser: state.elvanUser,
        loading: false,
      );

      ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(AppLocalizations.of(context)?.emailEmpty ?? '');
      return false;
    } else if (phone.isEmpty) {
      state = state.copyWith(
        elvanUser: state.elvanUser,
        loading: false,
      );

      ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(AppLocalizations.of(context)?.phoneEmpty ?? '');
      return false;
    } else if (password.isEmpty) {
      state = state.copyWith(
        elvanUser: state.elvanUser,
        loading: false,
      );

      ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(
            AppLocalizations.of(context)?.passwordEmpty ?? '',
          );
      return false;
    } else {
      return true;
    }
  }
}
