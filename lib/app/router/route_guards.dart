import 'package:auto_route/auto_route.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authGuardProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);
  final loggedIn = authState.valueOrNull != null;

  print('AuthGuard: loggedIn: $loggedIn');

  return AuthGuard(loggedIn);
});

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this.isLoggedIn);
  final bool isLoggedIn;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    debugPrint('AuthGuard: -> Root key -> ${router.key}');
    debugPrint('AuthGuard: -> Path -> ${resolver.route.path}');

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      // router.push(const NotFoundRoute());

      router.replaceAll([const AuthRouter()]);
    }
  }
}
