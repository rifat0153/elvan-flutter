import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteScreen extends HookConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Column(
          children: [
            const Text('FavoriteScreen'),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Container(
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.all(8),
                    color: Colors.red,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
