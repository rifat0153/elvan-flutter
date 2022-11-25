import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  const AuthRepository({
    required this.firebaseAuth,
  });

  final FirebaseAuth firebaseAuth;

  Future<User?> singInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<User?> signInAnyonymously() async {
    log('AuthRepository.signInAnyonymously()');
    final userCredential = await firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  Future<bool> signOut() async {
    await firebaseAuth.signOut();
    return true;
  }
}
