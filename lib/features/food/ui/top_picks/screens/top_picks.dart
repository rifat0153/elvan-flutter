import 'package:elvan/features/food/ui/top_picks/notifier/top_picks_notifier.dart';
import 'package:elvan/features/food/ui/top_picks/screens/top_picks_grid.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPicksWidget extends HookConsumerWidget {
  const TopPicksWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topPicksState = ref.watch(topPicksNotifierProvider);

    return topPicksState.when(
      data: (topPicks) => TopPicksGrid(foodItems: topPicks),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (message) => Center(
        child: Text(message ?? 'Something went wrong'),
      ),
    );
  }
}
