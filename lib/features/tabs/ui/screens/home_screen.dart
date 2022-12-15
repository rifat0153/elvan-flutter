// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:elvan/features/category/ui/screens/category_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CategoryListWidget(),
        ),
      ],
    );
  }
}
