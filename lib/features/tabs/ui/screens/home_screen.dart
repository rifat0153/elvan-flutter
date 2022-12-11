// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:elvan/core/custom_sliver_list/custom_sliver_list.dart';
import 'package:elvan/features/category/ui/screens/category_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomSliverList(
        nestedWidgetList: [
          [
            Text(
              'Home Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
          [const CategoryList()],
          [const CategoryList()],
          [const CategoryList()],
          for (var i = 0; i < 100; i++)
            [
              const CategoryList(),
            ],
        ],
      ),
    );
  }
}
