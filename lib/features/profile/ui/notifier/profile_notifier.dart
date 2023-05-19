import 'dart:async';

import 'package:elvan/features/auth/domain/usecase/auth_usecases.dart';
import 'package:elvan/features/profile/ui/state/profile_screen_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileNotifierProvider = NotifierProvider<ProfileNotifier, ProfileScreenState>(ProfileNotifier.new);

class ProfileNotifier extends Notifier<ProfileScreenState> {
  late final AuthUseCases authUseCase;
  late final StreamSubscription<User?> authStateChangesSubscription;

  @override
  ProfileScreenState build() {
    authUseCase = ref.read(authUseCaseProvider);
    authStateChangesSubscription = authUseCase.getUserStreamUseCase().listen(
          handleUserStream,
        );

    // dispose (just like widget dispose)
    // cancel all subscriptions and close all streams
    ref.onDispose(() {
      authStateChangesSubscription.cancel();
    });
    return const ProfileScreenState.unAuthenticated();
  }

  void handleUserStream(User? user) {
    if (user != null) {
      getElvanUserData(user.uid);
    }
  }

  Future getElvanUserData(String userID) async {
    state = const ProfileScreenState.loading();
    final result = await authUseCase.getUserUseCase(userId: userID);

    result.when(
      success: (elvanUser) {
        state = ProfileScreenState.authenticated(elvanUser);
      },
      failure: (failure) {
        state = ProfileScreenState.error(failure.message);
      },
    );
  }
}
