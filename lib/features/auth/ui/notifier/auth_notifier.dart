import 'package:elvan/features/auth/domain/usecase/auth_usecase.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/features/auth/ui/state/auth_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthScreenState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthScreenState> {
  AuthNotifier() : super() {
    state = const AuthScreenState.loading();
    authUseCase = ref.read(authUseCaseProvider);
  }
  late final AuthUseCase authUseCase;

  @override
  build() {
    return const AuthScreenState.loading();
  }

  void onEvent(AuthEvent event) {
    // use pattern matching to handle events
    event.when(
      isLogginIn: (email, password) {
        state = const AuthScreenState.loading();
        authUseCase.signInWithEmailAndPasswordUseCase(email: email, password: password);
      },
      isLogginOut: () {
        state = const AuthScreenState.loading();
        authUseCase.signOutUseCase();
        state = const AuthScreenState.unAuthenticated();
      },
      registerWithEmailAndPassword: (email, password) {
        state = const AuthScreenState.loading();
        final result = authUseCase.signInWithEmailAndPasswordUseCase(email: email, password: password);
      },
      resetPassword: (email) {},
      goToRegisterScreen: () {
        state = const AuthScreenState.loading();
      },
    );
  }
}
