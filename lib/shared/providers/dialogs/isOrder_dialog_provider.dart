import 'package:elvan/app/router/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final isOrerProgressDialogProvider = Provider<void>((ref) {
  showDialog(
      context: ref.read(appRouterProvider).navigatorKey.currentState!.context,
      builder: (_) {
        return AlertDialog(
          title: Text(AppLocalizations.of(_)!.orderInProcess),
          content: Text(AppLocalizations.of(_)!.orderInProcessMessage),
          actions: [
            TextButton(
                onPressed: () {
                  ref.read(appRouterProvider).pop();
                },
                child: const Text('Ok'))
          ],
        );
      });
});
