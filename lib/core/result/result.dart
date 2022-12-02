import 'package:elvan/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result {
  const factory Result.data(T data) = _Result_Data;
  const factory Result.error(Failure failure) = _Result_Error;
}
