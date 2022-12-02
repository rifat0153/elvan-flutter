import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/core/failure/failure.dart';
import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/auth/constants/constants.dart';
import 'package:elvan/features/auth/data/dto/elvan_user_dto.dart';
import 'package:elvan/features/auth/data/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';

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
            fromFirestore: (snapshot, _) => ElvanUserDto.fromJson(snapshot.data()!),
            toFirestore: (elvanUserDto, _) => elvanUserDto.toJson(),
          )
          .doc(userId)
          .get();

      if (user.exists) {
        return Result.data(user.data()!);
      } else {
        return const Result.error(
          Failure(message: 'User not found'),
        );
      }
    } on Exception catch (e) {
      return Result.error(
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
    debugPrint('AuthRepository.signInAnyonymously()');

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
}
