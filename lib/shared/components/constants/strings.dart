import 'package:freezed_annotation/freezed_annotation.dart';

@Immutable()
class Strings {
  static const String appName = "Elvan";
  static const String loading = "Loading...";
  static const String error = "Error";

  static const delete = 'Delete';
  static const areYouSureYouWantToDeleteThis = 'Are you sure you want to delete this';

  static const logOut = 'Log out';
  static const areYouSureThatYouWantToLogOutOfTheApp = 'Are you sure that you want to log out of the app?';
  static const cancel = 'Cancel';
}
