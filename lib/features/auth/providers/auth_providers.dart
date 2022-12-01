import 'dart:async';
import 'dart:developer';

import 'package:elvan/features/auth/constants/constants.dart';
import 'package:elvan/features/auth/data/repository/auth_repository.dart';
import 'package:elvan/features/auth/domain/models/auth_state.dart';
import 'package:elvan/features/auth/domain/models/elvan_user.dart';
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
Future<ElvanUser?> elvanUser(ElvanUserRef ref) async {
  final user = ref.watch(currentUserProvider);

  if (user == null) {
    return null;
  }

  final elvanUser = await ref
      .read(firebaseFirestoreProvider)
      .collection(
        Constants.firebaseElvanUserCollectionName,
      )
      .withConverter(
        fromFirestore: (snapshot, _) => ElvanUser.fromJson(snapshot.data()!),
        toFirestore: (elvanUser, _) => elvanUser.toJson(),
      )
      .doc(user.uid)
      .get();

  return elvanUser.data();
}

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  AuthState build() {
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
      final user = await ref.read(authRepositoryProvider).signInAnyonymously();
      state = AuthState.loggedIn(user: user!);
    } on FirebaseAuthException catch (e) {
      log('signInAnyonymously: $e');
      state = AuthState.error(e.message);
    } catch (e) {
      log('signInAnyonymously: $e');
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signOut() async {
    state = const AuthState.loading();

    try {
      await ref.read(authRepositoryProvider).signOut();
      state = const AuthState.signedOut();
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }
}
