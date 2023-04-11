import 'package:elvan/core/failure/failure.dart';
import 'package:elvan/core/result/result.dart';
import 'package:elvan/features/auth/data/repository/auth_repository.dart';
import 'package:elvan/features/auth/data/repository/auth_repository_impl.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_usecases.g.dart';

@riverpod
AuthUseCases authUseCase(AuthUseCaseRef ref) {
  return AuthUseCases(
    authRepository: ref.read(authRepositoryProvider),
  );
}

class AuthUseCases {
  final AuthRepository authRepository;

  const AuthUseCases({
    required this.authRepository,
  });

  Future<Result<ElvanUser>> getUserUseCase({required String userId}) async {
    final user = await authRepository.getElvanUser(userId: userId);

    return user.when(
      success: (elvanUserDto) {
        return Result.success(
          ElvanUser.fromDto(elvanUserDto),
        );
      },
      failure: (failure) {
        return Result.failure(failure);
      },
    );
  }

  Future<Result<ElvanUser>> signInWithEmailAndPasswordAndGetElvanUserUseCase({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return const Result.failure(
          Failure(message: 'Email or password is empty'));
    }

    final user = await authRepository.singInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (user == null) {
      return const Result.failure(
        Failure(message: 'User is null'),
      );
    }

    final elvanUser = await getUserUseCase(userId: user.uid);

    return elvanUser.when(
      success: (elvanUser) {
        return Result.success(elvanUser);
      },
      failure: (failure) {
        return Result.failure(failure);
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

  //sign up with email and password

  Future<Result<ElvanUser>> signUpWithEmailAndPasswordAndGetElvanUserUseCase({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return const Result.failure(
          Failure(message: 'Email or password is empty'));
    }

    final user = await authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    //loging in with UserCredential

    if (user == null) {
      return const Result.failure(
        Failure(message: 'User is null'),
      );
    }
    await setUserUseCase(userId: user.uid, elvanUser: ElvanUser(
      name: username,
      email: user.email,
      imageUrl: user.photoURL,
      phone: phone,
      uid: user.uid,
    ));
    final elvanUser = await getUserUseCase(userId: user.uid);

    return elvanUser.when(
      success: (elvanUser) {
        return Result.success(elvanUser);
      },
      failure: (failure) {
        return Result.failure(failure);
      },
    );
  }

  Stream<User?> getUserStreamUseCase() {
    return authRepository.getUserStream();
  }

  Future<bool> signOutUseCase() async {
    return authRepository.signOut();
  }

  Future setUserUseCase({
    required String userId,
    required ElvanUser elvanUser,
  }) async {
    return authRepository.setElvanUser(
      userId: userId,
      elvanUserDto: elvanUser.toDto(),
    );
  }

  resetPasswordUseCase({required String email}) {
    return authRepository.resetPassword(email: email);
  }
}
