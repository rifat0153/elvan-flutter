import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan_shared/domain_models/index.dart';
import 'package:elvan_shared/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../notifier/auth_notifier.dart';

class ForgetScreen extends HookConsumerWidget {
  const ForgetScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    // final isAuthenticated = ref.read(
    //   authNotifierProvider.notifier.select((v) => v.isAuthenticated),
    // );

    final emailTextController = useTextEditingController();

    return ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ElvanAppBar(title: "Password rest"),
          authState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            unKnown: () => const Center(child: Text('Unknown')),
            unAuthenticated: () => Padding(
              padding: const EdgeInsets.all(AppSize.paddingLG),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailTextController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      //rounded white border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      //filled white background
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppSize.kPadding * 2),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(1.sw, 34),
                      backgroundColor: AppColors.primaryRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.radiusLG),
                      ),
                    ),
                    onPressed: () async {
                      authNotifier.onEvent(AuthEvent.resetPassword(
                        email: emailTextController.text,
                      ));
                    },
                    child: const AppText('Get Code'),
                  ),
                ],
              ),
            ),
            authenticated: (elvanUser) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Authenticated: ${elvanUser.email}'),
                  ElevatedButton(
                    onPressed: () {
                      authNotifier.onEvent(const AuthEvent.logout());
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
            error: (message) => Center(child: Text('Error: $message')),
          ),
        ],
      ),
    );
  }
}
