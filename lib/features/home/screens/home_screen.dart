import 'package:elvan/navigation/provider/root_navigator_key.dart';
import 'package:elvan/shared/components/appbars/main_appbar.dart';
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
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                //   filterQuality: FilterQuality.high,
                image: AssetImage(
                    '${Strings.assetImages}app_background_main.png'))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Home Screen'),
              ElevatedButton(
                onPressed: () => ref
                    .read(
                      rootNavigatorKeyProvider.notifier,
                    )
                    .navigateToFoodDetail(),
                child: const Text('Navigate to Food Navigator'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
