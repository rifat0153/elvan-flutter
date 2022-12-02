import 'package:elvan/features/auth/data/dto/elvan_user_dto.dart';
import 'package:elvan/features/cart/models/cart/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> singInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<ElvanUserDto?> getElvanUser({required String userId});

  Future<User?> signInAnyonymously();

  Future<bool> signOut();
}
