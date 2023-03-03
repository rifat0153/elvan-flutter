import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan_shared/dtos/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:elvan/core/failure/failure.dart';
import 'package:elvan/core/firebase/firebase_providers.dart';
import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/auth/constants/constants.dart';
import 'package:elvan/features/auth/data/dto/elvan_user_dto.dart';
import 'package:elvan/features/auth/data/repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    firebaseAuth: ref.watch(firebaseAuthProvider),
    firebaseFirestore: ref.watch(firebaseFirestoreProvider),
  );
});

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  @override
  Future<Result<ElvanUserDto>> getElvanUser({required String userId}) async {
    try {
      final user = await firebaseFirestore
          .collection(
            Constants.firebaseElvanUserCollectionName,
          )
          .withConverter(
            fromFirestore: (snapshot, _) =>
                ElvanUserDto.fromJson(snapshot.data()!),
            toFirestore: (elvanUserDto, _) => elvanUserDto.toJson(),
          )
          .doc(userId)
          .get();

      if (user.exists) {
        return Result.success(user.data()!);
      } else {
        return const Result.failure(
          Failure(message: 'User not found'),
        );
      }
    } on Exception catch (e) {
      return Result.failure(
        Failure(
          error: e,
          message: 'Error while getting user',
        ),
      );
    }
  }

  @override
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

  @override
  Future<User?> signInAnyonymously() async {
    final userCredential = await firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<bool> signOut() async {
    await firebaseAuth.signOut();
    return true;
  }

  @override
  Stream<User?> getUserStream() {
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<void> setElvanUser(
      {required String userId, required ElvanUserDto elvanUserDto}) async {
    await firebaseFirestore
        .collection(
          Constants.firebaseElvanUserCollectionName,
        )
        .withConverter(
          fromFirestore: (snapshot, _) =>
              ElvanUserDto.fromJson(snapshot.data()!),
          toFirestore: (elvanUserDto, _) => elvanUserDto.toJson(),
        )
        .doc(userId)
        .set(elvanUserDto);
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    //sign up
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    //sign in
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // return Result.success(userCredential);
    return userCredential.user;
  }

  @override
  Future resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
