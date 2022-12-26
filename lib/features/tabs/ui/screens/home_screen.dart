import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/features/category/ui/screens/category_list.dart';
import 'package:elvan/features/food/ui/top_picks/screens/top_picks.dart';
import 'package:elvan/features/order/ui/recent_order/screens/recent_orders.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CategoryListWidget(),
        ),
        SliverToBoxAdapter(
          child: RecentOrdersWidget(),
        ),
        SliverToBoxAdapter(
          child: TopPicksWidget(),
        ),
      ],
    );
  }
}
