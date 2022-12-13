import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteScreen extends HookConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      key: const PageStorageKey('FavoriteScreen_ListView'),
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.all(8),
          color: Colors.red,
          child: Text('Item $index', style: const TextStyle(fontSize: 24)),
        );
      },
    );
  }
}
