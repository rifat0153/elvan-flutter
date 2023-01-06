import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/auth/data/dto/elvan_user_dto.dart';
import 'package:elvan_shared/dtos/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> singInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Result<ElvanUserDto>> getElvanUser({required String userId});

  Future<User?> signInAnyonymously();

  Stream<User?> getUserStream();

  Future<bool> signOut();
}
