import 'package:elvan/app/router/navigator_provider.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/badge/elvan_icon_badge.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan_shared/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/features/category/ui/screens/category_list.dart';
import 'package:elvan/features/food/ui/components/top_picks.dart';
import 'package:elvan/features/order/ui/recent_order/screens/recent_orders.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var snakbar = ref.read(snackbarNotifierProvider.notifier);
    return ElvanScaffold(
      appBar: const ElvanAppBar(title: 'Elvan', showBackButton: false),
      floatingActionButton: Consumer(builder: (context, ref, child) {
        final cartItemCount = ref.watch(cartProvider).cartItems?.length ?? 0;
        return cartItemCount == 0
            ? Container()
            : FloatingActionButton(
                onPressed: () {},
                child: ElvanIconBadge(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: AppColors.black,
                  ),
                  count: cartItemCount,
                  onPressed: ref.read(navigatorProvider.notifier).pushCartRoute,
                ),
              );
      }),
      imagePath: AppAsset.homeBackgroundPng,
      child: const CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: ElvanButton(
          //     onPressed: () {
          //       snakbar.showSnackbarWithAction(
          //         'Hello',
          //         actionLabel: 'Undo',
          //         onAction: () {
          //           logInfo('Undo');
          //         },
          //       );

          //       snakbar.alartDialog(
          //           title: "title", content: "content", onOk: () {});
          //     },
          //     child: const Text('show snackbar'),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: CategoryListWidget(),
          ),
          SliverToBoxAdapter(
            child: RecentOrdersWidget(),
          ),
          SliverToBoxAdapter(
            child: TopPicksWidget(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: AppSize.kPadding * 10,
            ),
          )
        ],
      ),
    );
  }
}
