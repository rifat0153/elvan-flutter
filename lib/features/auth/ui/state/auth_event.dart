import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginWithPasswordAndEmail({
    required String email,
    required String password,
  }) = _AuthEvent_IsLogginIn;

  const factory AuthEvent.logout() = _AuthEvent_LogginOut;

  const factory AuthEvent.registerWithEmailAndPassword({
    required String email,
    required String password,
  }) = _AuthEvent_RegisterWithEmailAndPassword;

  const factory AuthEvent.resetPassword({
    required String email,
  }) = _AuthEvent_ResetPassword;

  const factory AuthEvent.goToRegisterScreen() = _AuthEvent_GoToRegisterScreen;
}
