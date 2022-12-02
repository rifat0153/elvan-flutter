import 'package:elvan/features/auth/data/repository/auth_repository.dart';
import 'package:elvan/features/auth/domain/models/elvan_user.dart';

class GetUserUseCase {
  final AuthRepository authRepository;

  GetUserUseCase(this.authRepository);

  Future<ElvanUser?> call({required String userId}) async {
    final user = await authRepository.getElvanUser(userId: userId);

    if (user == null) return null;

    return ElvanUser.fromDto(user);
  }
}



