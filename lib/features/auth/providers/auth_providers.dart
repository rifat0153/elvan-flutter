import 'dart:async';

import 'package:elvan/features/auth/repository/auth_repository.dart';
import 'package:elvan/features/auth/models/auth_state.dart';
import 'package:elvan/shared/providers/firebase/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(firebaseAuth: ref.watch(firebaseAuthProvider));
}

@riverpod
User? currentUser(CurrentUserRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return firebaseAuth.currentUser;
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

  @override
  AuthState build() {
    _authRepository = ref.read(authRepositoryProvider);

    final currentUser = ref.read(currentUserProvider);

    if (currentUser == null) {
      return const AuthState.signedOut();
    } else {
      return AuthState.loggedIn(user: currentUser);
    }
  }

  Future<void> signInAnyonymously() async {
    state = const AuthState.loading();

    try {
      final user = await _authRepository.signInAnyonymously();
      state = AuthState.loggedIn(user: user!);
    } on FirebaseAuthException catch (e) {
      state = AuthState.error(e.message);
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
