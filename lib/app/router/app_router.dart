import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:elvan/features/order/ui/order_records/screens/order_records.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/app/router/not_found_screen.dart';
import 'package:elvan/app/router/route_guards.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/auth/ui/screens/auth_screen.dart';
import 'package:elvan/features/cart/ui/screens/cart_screen.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/food/ui/screens/food_detail_screen.dart';
import 'package:elvan/features/food/ui/screens/food_list_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:elvan/features/tabs/ui/screens/bottom_tab_screen.dart';

final appRouterProvider = Provider.autoDispose<AppRouter>((ref) {
  // final user = ref.read(currentUserProvider);
  // final isLoggedIn = user != null;
  // print('appRouterProvider: isLoggedIn: $isLoggedIn');

  return AppRouter(
      // authGuard: AuthGuard(isLoggedIn),
      );
});

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    RedirectRoute(path: '/', redirectTo: '/tabs'),
    AutoRoute(
      path: '/auth',
      name: 'AuthRouter',
      page: AuthScreen,
    ),
    AutoRoute(
      path: '/tabs',
      name: 'BottomTabRouter',
      // guards: [AuthGuard],
      page: BottomTabScreen,
      children: [
        // create home, profile and favorites routes
        AutoRoute(
          path: 'home',
          // name: 'HomeTabRoute',
          page: HomeScreen,
        ),
        AutoRoute(
          path: 'favorites',
          // name: 'FavoritesTabRoute',
          page: FavoriteScreen,
        ),
        AutoRoute(
          path: 'profile',
          // name: 'ProfileTabRoute',
          page: ProfileScreen,
        ),
        RedirectRoute(path: '*', redirectTo: 'home'),
      ],
    ),
    AutoRoute(
      path: '/food',
      name: 'FoodRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          page: FoodListScreen,
        ),
        AutoRoute(
          path: 'details',
          page: FooDDetailScreen,
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: '/cart',
      page: CartScreen,
    ),
    AutoRoute(
      path: '*',
      page: NotFoundScreen,
    ),
    //order routes
    AutoRoute(
      path: '/order',
      name: 'OrderRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          page: OrdersRecordsScreen,
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
)
class $AppRouter {}
