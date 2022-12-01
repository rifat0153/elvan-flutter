import 'package:elvan/features/auth/data/repository/auth_repository.dart';
import 'package:elvan/features/auth/domain/models/elvan_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  const AuthUseCase({
    required this.authRepository,
  });

  Future<ElvanUser?> getElvanUserUseCase({required String userId}) async {
    final user = await authRepository.getElvanUser(userId: userId);

    if (user == null) return null;

    return ElvanUser.fromDto(user);
  }

  Future<User?> signInWithEmailAndPasswordUseCase({
    required String email,
    required String password,
  }) async {
    return authRepository.singInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<bool> signOutUseCase() async {
    return authRepository.signOut();
  }
}
