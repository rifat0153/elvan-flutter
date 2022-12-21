// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:elvan/features/category/ui/screens/category_list.dart';
import 'package:elvan/features/food/ui/top_picks/notifier/top_picks_notifier.dart';
import 'package:elvan/features/food/ui/top_picks/screens/top_pick_card_old.dart';
import 'package:elvan/features/food/ui/top_picks/screens/top_picks.dart';
import 'package:elvan/features/order/ui/recent_order/screens/recent_orders.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topPicksState = ref.watch(topPicksNotifierProvider);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CategoryListWidget(),
        ),
        // SliverToBoxAdapter(
        //   child: RecentOrdersWidget(),
        // ),
        SliverToBoxAdapter(
          child: TopPicksWidget(),
        ),
      ],
    );
  }
}
