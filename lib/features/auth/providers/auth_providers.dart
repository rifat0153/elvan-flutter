import 'package:elvan/features/auth/data/repository/auth_repository.dart';
import 'package:elvan/features/auth/data/repository/auth_repository_impl.dart';
import 'package:elvan/features/auth/domain/usecase/auth_usecases.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/shared/providers/firebase/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
  );
});

@Riverpod(keepAlive: true)
bool isAuthenticated(IsAuthenticatedRef ref) {
  debugPrint('isAuthenticated provider called');

  return ref.watch(authNotifierProvider.notifier).isAuthenticated;
}

@riverpod
AuthUseCases authUseCase(AuthUseCaseRef ref) {
  return AuthUseCases(
    authRepository: ref.read(authRepositoryProvider),
  );
}

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

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
