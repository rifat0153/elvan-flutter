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
    return const CustomScrollView(
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
      ],
    );
  }
}
