import 'package:auto_route/auto_route.dart';
import 'package:elvan/shared/components/background/elvan_safe_remove_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan_shared/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/app/router/app_router.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';

import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final isAuthenticated = ref.read(
      authNotifierProvider.notifier.select((v) => v.isAuthenticated),
    );

    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final isShowPassword = useState<bool>(true);
    final currentRoute = ref.read(appRouterProvider).current.path;

    return
        // appBar: AppBar(
        //   title: Text('Auth $isAuthenticated '),
        // ),
        WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: ElvanSafeRemoveScaffold(
        imagePath: AppAsset.homeBackgroundPng,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Text('Auth Screen'),
            // Text('Current Route --> $currentRoute'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(AppSize.paddingLG),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //asset image
                  Image.asset(
                    AppAsset.redLogo,
                    width: 200,
                    height: 180,
                  ),

                  TextField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),

                      // icon: Icon(Icons.email),
                      prefixIcon: const Icon(Icons.person,
                          color: AppColors.grey, size: 20),
                      hintText: AppLocalizations.of(context)?.email ?? 'Email',
                      //rounded white border
                      border: const OutlineInputBorder(
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
                  TextField(
                    controller: passwordTextController,
                    obscureText: isShowPassword.value,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),

                      suffixIcon: IconButton(
                          onPressed: () {
                            isShowPassword.value = !isShowPassword.value;
                          },
                          icon: isShowPassword.value
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.grey,
                        size: 20,
                      ),
                      hintText:
                          AppLocalizations.of(context)?.password ?? 'Password',
                      border: const OutlineInputBorder(
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        context.pushRoute(const ForgetRouter());
                      },
                      child: AppText(
                          AppLocalizations.of(context)?.forgotPassword ??
                              'Forgot Password?',
                          color: AppColors.grey),
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
                      authNotifier.onEvent(
                        AuthEvent.loginWithPasswordAndEmail(
                          // email: 'elvan@gmail.com',
                          // password: '123456',
                          email: emailTextController.text,
                          password: passwordTextController.text,
                        ),
                      );
                    },
                    child: authState.loading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                                color: AppColors.white),
                          )
                        : AppText(
                            AppLocalizations.of(context)?.login ?? 'Login'),
                  ),
                  //dont have an account button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(AppLocalizations.of(context)?.donthaveAccount ??
                          'Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          // authNotifier.onEvent(const AuthEvent.register());

                          //auto route
                          context.pushRoute(const RegRouter());
                        },
                        child: AppText(AppLocalizations.of(context)?.register ??
                            'Register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppText(
                AppLocalizations.of(context)?.allRight ?? '',
                style: const TextStyle(
                  fontSize: 12,
                ),
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
