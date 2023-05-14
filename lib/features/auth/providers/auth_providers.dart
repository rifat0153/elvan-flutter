import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/firebase/firebase_providers.dart';
import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';

part 'auth_providers.g.dart';

// FirebaseAuth providers
@Riverpod(keepAlive: true)
bool isAuthenticated(IsAuthenticatedRef ref) {
  return ref.watch(authNotifierProvider.notifier).isAuthenticated;
}

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final currentUserProvider = Provider<User?>((ref) {
  final user = ref.watch(authStateProvider).value;

  logError('currentUser: ${user?.uid}');

  return user;
});

final currentUserIdProvider = Provider<String?>((ref) {
  final user = ref.watch(currentUserProvider);

  logError('currentUserId: ${user?.uid}');

  return user?.uid;
});
