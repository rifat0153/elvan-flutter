import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/auth/data/repository/auth_repository.dart';
import 'package:elvan/features/auth/domain/models/elvan_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUseCases {
  final AuthRepository authRepository;

  const AuthUseCases({
    required this.authRepository,
  });

  Future<Result<ElvanUser>> getUserUseCase({required String userId}) async {
    final user = await authRepository.getElvanUser(userId: userId);

    return user.when(
      data: (elvanUserDto) {
        return Result.data(
          ElvanUser.fromDto(elvanUserDto),
        );
      },
      error: (failure) {
        return Result.error(failure);
      },
    );
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
