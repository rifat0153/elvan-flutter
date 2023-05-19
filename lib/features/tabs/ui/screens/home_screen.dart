import 'package:elvan/app/router/navigator_provider.dart';
import 'package:elvan/features/cart/ui/notifier/cart_notifier.dart';
import 'package:elvan/features/order/domain/usecases/order_use_case.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/badge/elvan_icon_badge.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
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
    final isTakingOrder = ref.watch(isTakingOrderProvider);

    return ElvanScaffold(
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
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: isTakingOrder.when(
                  data: (data) {
                    return data
                        ? Container()
                        : Container(
                            margin: const EdgeInsets.all(AppSize.paddingMD),
                            padding: const EdgeInsets.all(AppSize.paddingSM),
                            decoration: BoxDecoration(
                              color: AppColors.primaryRed,
                              borderRadius: BorderRadius.circular(10),
                              //round
                            ),
                            child: Column(
                              children: [
                                AppText(
                                  "Sorry!",
                                  style: Theme.of(context).textTheme.headlineLarge,
                                ),
                                AppText(
                                  "We are not taking order right now.\nThank you for being with us.",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          );
                  },
                  error: (e, s) => AppText(e.toString()),
                  loading: () => const CircularProgressIndicator())),
          const SliverToBoxAdapter(
            child: CategoryListWidget(),
          ),
          const SliverToBoxAdapter(
            child: RecentOrdersWidget(),
          ),
          const SliverToBoxAdapter(
            child: TopPicksWidget(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: AppSize.kPadding * 10,
            ),
          )
        ],
      ),
    );
  }
}
