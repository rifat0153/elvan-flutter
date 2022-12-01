import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.loggedIn({required User user}) = _Data;
  const factory AuthState.signedOut() = _SignedOut;
  const factory AuthState.error([String? message]) = _Error;
}
