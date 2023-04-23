import 'package:elvan/features/food/ui/notifier/top_picks_notifier.dart';
import 'package:elvan/features/food/ui/components/top_picks_grid.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPicksWidget extends HookConsumerWidget {
  const TopPicksWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topPicksState = ref.watch(topPicksProvider);

    return topPicksState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (topPicks) => TopPicksGrid(foodItems: topPicks),
      // data: (topPicks) => TopPicksGridOld(foodItems: topPicks),
      error: (message, st) => Center(
        child: Text(message.toString()),
      ),
    );
  }
}
