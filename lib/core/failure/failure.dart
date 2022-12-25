// class to handle api exceptions
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  const factory Failure({
    String? message,
    Object? error,
  }) = _Failure;

  @override
  String toString() {
    return message ?? getErrorMessageFromExcetion();
  }

  String getErrorMessageFromExcetion() {
    if (message != null) return message!;

    if (error is SocketException) {
      return 'No Internet Connection';
    } else if (error is HttpException) {
      return 'No Service Found';
    } else if (error is FormatException) {
      return 'Invalid Response Format';
    } else if (error is FirebaseAuthException) {
      return (error as FirebaseAuthException).message ?? '';
    } else if (error is FirebaseException) {
      return (error as FirebaseException).message ?? '';
    } else {
      return 'Unexpected Error';
    }
  }
}
