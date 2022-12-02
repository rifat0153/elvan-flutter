import 'package:elvan/core/failure/failure.dart';
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

  Future<Result<ElvanUser>> signInWithEmailAndPasswordAndGetElvanUserUseCase({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return const Result.error(Failure(message: 'Email or password is empty'));
    }

    final user = await authRepository.singInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (user == null) {
      return const Result.error(
        Failure(message: 'User is null'),
      );
    }

    final elvanUser = await getUserUseCase(userId: user.uid);

    return elvanUser.when(
      data: (elvanUser) {
        return Result.data(elvanUser);
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

  Stream<User?> getUserStreamUseCase() {
    return authRepository.getUserStream();
  }

  Future<bool> signOutUseCase() async {
    return authRepository.signOut();
  }
}
