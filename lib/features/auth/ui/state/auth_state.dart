import 'package:elvan/features/auth/domain/models/elvan_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unKnown() = _AuthState_UnKnown;
  const factory AuthState.authenticated(ElvanUser elvanUser) = _AuthState_Authenticated;
  const factory AuthState.unAuthenticated() = _AuthState_UnAuthenticated;
  const factory AuthState.error([String? message]) = _AuthState_Error;
}
