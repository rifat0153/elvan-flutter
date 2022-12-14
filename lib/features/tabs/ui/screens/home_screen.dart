// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:elvan/core/custom_sliver_list/custom_sliver_list.dart';
import 'package:elvan/features/category/ui/screens/category_list.dart';
import 'package:elvan/features/food/ui/top_picks/screens/top_picks.dart';
import 'package:elvan/shared/components/background/background_image_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BackgroundImageWidget(
      imagePath: AppAsset.homeBackgroundPng,
      child: CustomSliverList(
        isPrimary: true,
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
          [
            const CategoryListWidget(),
            const SizedBox(height: 20),
          ],
          [
            TopPicksWidget(),
          ],
        ],
      ),
    );
  }
}
