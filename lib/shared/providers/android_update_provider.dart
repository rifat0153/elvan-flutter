import 'dart:io';

import 'package:elvan/shared/providers/scaffold_messenger/snackbar_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_update/in_app_update.dart';

final androidUpdateProvider = FutureProvider<void>((ref) async {
  if (Platform.isIOS) {
    return;
  }
  final appUpdate = await InAppUpdate.checkForUpdate();
  if (appUpdate.updateAvailability == UpdateAvailability.updateAvailable) {
    InAppUpdate.performImmediateUpdate().catchError((e) {
      ref.read(snackbarNotifierProvider.notifier).showSnackbarWithMessage(e);
      return AppUpdateResult.inAppUpdateFailed;
    });
  }
});
