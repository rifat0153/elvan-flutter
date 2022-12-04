import 'package:elvan/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = _Result_Data;
  const factory Result.failure(Failure failure) = _Result_Error;
}
