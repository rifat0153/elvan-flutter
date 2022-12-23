import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/shared/providers/firebase/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

// FirebaseAuth providers
@Riverpod(keepAlive: true)
bool isAuthenticated(IsAuthenticatedRef ref) {
  debugPrint('isAuthenticated provider called');

  return ref.watch(authNotifierProvider.notifier).isAuthenticated;
}

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

@riverpod
User? currentUser(CurrentUserRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  print('currentUser: ${firebaseAuth.currentUser}');

  return firebaseAuth.currentUser;
}

@riverpod
String? currentUserId(CurrentUserIdRef ref) {
  final user = ref.watch(currentUserProvider);

  return user?.uid;
}
