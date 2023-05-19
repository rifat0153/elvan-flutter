import 'package:elvan_shared/domain_models/elvan_user/elvan_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_screen_state.freezed.dart';

@freezed
class ProfileScreenState with _$ProfileScreenState {
  const factory ProfileScreenState.loading() = _ProfileScreenState_Loading;
  const factory ProfileScreenState.unKnown() = _ProfileScreenState_UnKnown;
  const factory ProfileScreenState.authenticated(ElvanUser elvanUser) = _ProfileScreenState_Authenticated;
  const factory ProfileScreenState.unAuthenticated() = _ProfileScreenState_UnAuthenticated;
  const factory ProfileScreenState.error([String? message]) = _ProfileScreenState_Error;
}
