import 'package:elvan/app/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final isNotTakingDialogProvider = Provider<void>((ref) {
  showDialog(
      context: ref.read(appRouterProvider).navigatorKey.currentState!.context,
      builder: (_) {
        return AlertDialog(
          title: Text(AppLocalizations.of(_)!.sorry),
          content: Text(AppLocalizations.of(_)!.noTakingOrders),
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
