import 'package:elvan/core/result/result.dart';
import 'package:elvan_shared/dtos/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Result<User?>> singInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<ElvanUserDto>> getElvanUser({required String userId});

  Future<User?> signInAnyonymously();

  Stream<User?> getUserStream();

  Future<bool> signOut();

  //set user data
  Future<void> setElvanUser({
    required String userId,
    required ElvanUserDto elvanUserDto,
  });

  //sign up
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  resetPassword({required String email});
}
