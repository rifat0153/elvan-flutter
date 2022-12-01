import 'package:elvan/features/auth/domain/models/auth_state.dart';
import 'package:elvan/features/auth/domain/usecase/auth_usecase.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthState> {
  AuthNotifier() : super() {
    state = const AuthState.loading();
    authUseCase = ref.read(authUseCaseProvider);
  }
  late final AuthUseCase authUseCase;

  @override
  build() {
    return const AuthState.loading();
  }

  void onEvent(AuthEvent event) {
    // use pattern matching to handle events
    event.when(
      isLogginIn: (email, password) {
        state = const AuthState.loading();
        authUseCase.signInWithEmailAndPasswordUseCase(email: email, password: password);
      },
      isLogginOut: () {
        state = const AuthState.loading();
        authUseCase.signOutUseCase();
        state = const AuthState.unauthenticated();
      },
      registerWithEmailAndPassword: (email, password) {
        state = const AuthState.loading();
        final result = authUseCase.signInWithEmailAndPasswordUseCase(email: email, password: password);
      },
    );
  }
}
