import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.isLogginIn({
    required String email,
    required String password,
  }) = _AuthEvent_IsLogginIn;

  const factory AuthEvent.isLogginOut() = _AuthEvent_LogginOut;

  const factory AuthEvent.registerWithEmailAndPassword({
    required String email,
    required String password,
  }) = _AuthEvent_RegisterWithEmailAndPassword;
}
