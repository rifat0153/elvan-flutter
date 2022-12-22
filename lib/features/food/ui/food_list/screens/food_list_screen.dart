import 'package:auto_route/auto_route.dart';
import 'package:elvan/core/router/app_router.gr.dart';
import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FoodListScreen extends HookConsumerWidget {
  const FoodListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ScreenBackground(
        imagePath: AppAsset.homeBackgroundPng,
        width: double.infinity,
        child: Column(
          children: [
            const AppText('Food List Screen'),
            ElevatedButton(
              child: const AppText(
                'Go to Detail',
                color: Colors.black,
              ),
              onPressed: () {
                print('Go to detail');

                context.navigateTo(const FooDDetailRoute());
                // context.pushRoute(const FooDDetailRoute());
              },
            ),
            ElevatedButton(
              child: const AppText(
                'Go to Back',
                color: Colors.black,
              ),
              onPressed: () {
                print('Go to Back');
                context.popRoute();
              },
            ),
          ],
        ),
      ),
    );
  }
}
