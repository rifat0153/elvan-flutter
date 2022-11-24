import 'dart:async';
import 'dart:developer';

import 'package:elvan/features/auth/api/auth_repository.dart';
import 'package:elvan/features/auth/models/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(firebaseAuth: ref.watch(firebaseAuthProvider));
}

@riverpod
User? currentUser(CurrentUserRef ref) {
  final authState = ref.watch(authStateNotifierProvider);

  return authState.maybeWhen(orElse: () => null, loggedIn: (user) => user);
}

@riverpod
String? currentUserId(CurrentUserIdRef ref) {
  final user = ref.watch(currentUserProvider);

  return user?.uid;
}

final authStateChangesProvider = StreamProvider.autoDispose<User?>(
  (ref) => ref.watch(firebaseAuthProvider).authStateChanges(),
);

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  late final AuthRepository _authRepository;

  late final StreamSubscription _authStateChangesSubscription;

  @override
  AuthState build() {
    _authRepository = ref.read(authRepositoryProvider);

    _authStateChangesSubscription = ref.watch(authStateChangesProvider.stream).listen(
      (user) {
        log('message: authStateChangesProvider.stream.listen user: $user');
        state = const AuthState.loading();
        if (user == null) {
          state = const AuthState.signedOut();
        } else {
          state = AuthState.loggedIn(user: user);
        }
      },
    );

    return const AuthState.signedOut();
  }

  Future<void> signInAnyonymously() async {
    state = const AuthState.loading();

    try {
      final user = await _authRepository.signInAnyonymously();
      state = AuthState.loggedIn(user: user!);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signOut() async {
    state = const AuthState.loading();

    try {
      await _authRepository.signOut();
      state = const AuthState.signedOut();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }
}
