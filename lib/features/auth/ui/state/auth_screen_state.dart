import 'package:elvan_shared/domain_models/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_screen_state.freezed.dart';

@freezed
class AuthScreenState with _$AuthScreenState {
  const factory AuthScreenState({@Default(false) bool loading, ElvanUser? elvanUser}) = _AuthScreenState;
}
