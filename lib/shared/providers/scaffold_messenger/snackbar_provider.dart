import 'package:elvan/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/shared/providers/scaffold_messenger/scaffold_messenger_key_provider.dart';

final snackbarNotifierProvider = NotifierProvider<SnackbarNotifier, void>(
  SnackbarNotifier.new,
);

class SnackbarNotifier extends Notifier<void> {
  late final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  @override
  build() {
    scaffoldMessengerKey = ref.read(scaffoldMessengerKeyProvider);
  }

  bool showSnackbar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      snackBar,
    );
    return true;
  }

  bool showSnackbarWithMessage(String message) {
    showSnackbar(
      SnackBar(
        content: Text(message),
      ),
    );
    return true;
  }

  bool showSnackbarWithAction(
    String message, {
    required String actionLabel,
    required VoidCallback onAction,
  }) {
    showSnackbar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: actionLabel,
          onPressed: onAction,
        ),
      ),
    );
    return true;
  }

  bool removeSnakbar() {
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    return true;
  }

  Future<Future> alartDialog({
    required String title,
    required String content,
    required VoidCallback onOk,
    VoidCallback? onCancel,
  }) async {
    return showDialog(
      context: scaffoldMessengerKey.currentContext!,
      builder: (context) => AlertDialog(
        //reounded corners
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            //red color
            style: TextButton.styleFrom(
              primary: AppColors.primaryRed,
            ),
            onPressed: onCancel ?? () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: onOk,
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
