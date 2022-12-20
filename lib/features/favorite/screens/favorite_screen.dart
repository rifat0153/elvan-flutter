import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteScreen extends HookConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => AppText(index.toString()),
            childCount: 10,
          ),
        ),
        //horizontal list
        SliverToBoxAdapter(
          child: Container(
            color: Colors.blue.shade200,
            height: 55,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AppText(index.toString());
                }),
          ),
        ),

        // //grid list
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          delegate: SliverChildListDelegate(
            List.generate(10, (index) => AppText(index.toString())),
          ),
        )
      ],
    );
  }
}
