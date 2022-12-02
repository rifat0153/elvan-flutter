import 'package:elvan/features/home/sections/category_section.dart';
import 'package:elvan/features/home/sections/recently_ordered_section.dart';
import 'package:elvan/features/home/sections/top_picks_section.dart';
import 'package:elvan/navigation/provider/root_navigator_key.dart';
import 'package:elvan/shared/components/appbars/main_appbar.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:elvan/shared/components/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                //   filterQuality: FilterQuality.high,
                image: AssetImage(
                    '${Strings.assetImages}app_background_main.png'))),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                // const Text('Home Screen'),
                // ElevatedButton(
                //   onPressed: () => ref
                //       .read(
                //         rootNavigatorKeyProvider.notifier,
                //       )
                //       .navigateToFoodDetail(),
                //   child: const Text('Navigate to Food Navigator'),
                // ),
                //
                SizedBox(height: 42),
                CategorySection(),
                RecentlyOrderedSection(),
                SizedBox(height: 20),
                TopPicksSection(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
