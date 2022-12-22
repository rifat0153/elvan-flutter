import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:elvan/features/favorite/screens/favorite_screen.dart';
import 'package:elvan/features/food/ui/food_detail/screens/food_detail_screen.dart';
import 'package:elvan/features/food/ui/food_list/screens/food_list_screen.dart';
import 'package:elvan/features/profile/ui/screens/profile_screen.dart';
import 'package:elvan/features/tabs/ui/screens/home_screen.dart';
import 'package:elvan/features/tabs/ui/screens/tab_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    RedirectRoute(path: "/", redirectTo: '/tabs'),
    AutoRoute(
      // initial: true,
      path: "/tabs",
      name: "TabsRouter",
      page: BottomTabScreen,
      children: [
        // create home, profile and favorites routes
        AutoRoute(
          path: "home",
          // name: "HomeTabRoute",
          page: HomeScreen,
        ),
        AutoRoute(
          path: "favorites",
          // name: "FavoritesTabRoute",
          page: FavoriteScreen,
        ),
        AutoRoute(
          path: "profile",
          // name: "ProfileTabRoute",
          page: ProfileScreen,
        ),
      ],
    ),
    AutoRoute(
      path: "/food",
      name: "FoodRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: "",
          page: FoodListScreen,
        ),
        AutoRoute(
          path: "details",
          page: FooDDetailScreen,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
