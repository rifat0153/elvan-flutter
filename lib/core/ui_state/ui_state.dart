import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
class UiState<T> with _$UiState<T> {
  const UiState._();

  const factory UiState.loading() = _State_Loading;
  const factory UiState.data(T data) = _State_Data;
  const factory UiState.error(String? error) = _State_Error;

  bool get isLoading => whenOrNull(loading: () => true) ?? false;
  bool get hasData => whenOrNull(data: (data) => true) ?? false;
  bool get hasError => whenOrNull(error: (error) => true) ?? false;

  bool get loading => whenOrNull(loading: () => true) ?? false;
  T? get data => whenOrNull(data: (data) => data);
  String? get error => whenOrNull(error: (error) => error);
}
