import 'package:elvan/core/extensions/build_context/screen_size_ext.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_safe_remove_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan_shared/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    return ElvanSafeRemoveScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElvanAppBar(title: AppLocalizations.of(context)?.passwordReset ?? "Password reset"),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 30),
                decoration: BoxDecoration(color: AppColors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(AppSize.radiusSM)),
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.paddingLG),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: emailTextController,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)?.emailHint ?? 'Enter your email',
                          //rounded white border
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          //filled white background
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: AppSize.kPadding * 2),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: SizedBox(
                  width: context.screenWidth,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(0.7.sw, 34),
                        backgroundColor: AppColors.primaryRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.radiusLG),
                        ),
                      ),
                      onPressed: () async {
                        authNotifier.onEvent(AuthEvent.resetPassword(email: emailTextController.text, context: context));
                      },
                      child: authState.loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(color: AppColors.white),
                            )
                          : AppText(AppLocalizations.of(context)?.getCode ?? 'Get Code'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
