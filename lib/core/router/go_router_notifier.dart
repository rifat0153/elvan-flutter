import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final goRouterNotifierProvider = ChangeNotifierProvider<GoRouterNotifier>((ref) {
  return GoRouterNotifier(ref);
});

class GoRouterNotifier extends ChangeNotifier {
  final Ref _ref;
  GoRouterNotifier(this._ref) {
    _ref.listen(authStateProvider, (previous, next) {
      debugPrint('authNotifierProvider changed');

      notifyListeners();
    });
  }
}
