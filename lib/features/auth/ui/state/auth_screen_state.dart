import 'package:elvan_shared/domain_models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_state.freezed.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  // const factory AuthScreenState.loading() = _AuthScreenState_Loading;
  // const factory AuthScreenState.unKnown() = _AuthScreenState_UnKnown;
  // const factory AuthScreenState.authenticated(ElvanUser elvanUser) =
  //     _AuthScreenState_Authenticated;
  // const factory AuthScreenState.unAuthenticated() =
  //     _AuthScreenState_UnAuthenticated;
  // const factory AuthScreenState.error([String? message]) =
  //     _AuthScreenState_Error;

  const factory AuthScreenState({
    @Default(false) bool loading,
    ElvanUser? elvanUser
  }) =
     _AuthScreenState;

}
