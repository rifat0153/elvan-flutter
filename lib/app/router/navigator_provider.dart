import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/app/router/app_router.dart';
import 'package:elvan/app/router/app_router.gr.dart';

final navigatorProvider = NotifierProvider<NavigatorNotifier, void>(() {
  return NavigatorNotifier();
});

class NavigatorNotifier extends Notifier<void> {
  late final AppRouter _router;

  @override
  build() {
    _router = ref.read(appRouterProvider);
    return;
  }

  void pop() {
    _router.pop();
  }

  void pushRoute(PageRouteInfo<dynamic> route) {
    _router.push(route);
  }

  void popAllPushTabRoute(int index) {
    _router.popUntilRoot();
    _router.push(const BottomTabRouter());
  }

  void pushCartRoute() {
    _router.push(const CartRoute());
  }
}
