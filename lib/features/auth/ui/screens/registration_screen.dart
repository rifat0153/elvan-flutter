import 'package:elvan/core/extensions/build_context/screen_size_ext.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/background/elvan_scaffold.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan_shared/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationScreen extends HookConsumerWidget {
  const RegistrationScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final phoneTextController = useTextEditingController();
    final usernameTextController = useTextEditingController();
    final isShowPassword = useState<bool>(true);

    return ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElvanAppBar(title: AppLocalizations.of(context)?.signup ?? "Registration"),
            //asset image
            Image.asset(
              AppAsset.redLogo,
              width: 200,
              height: 140,
            ),
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
                          controller: usernameTextController,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.email),
                            prefixIcon: const Icon(Icons.person, color: AppColors.grey),
                            hintText: AppLocalizations.of(context)?.username ?? 'Username',
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
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
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.email),
                            prefixIcon: const Icon(Icons.email, color: AppColors.grey),
                            hintText: AppLocalizations.of(context)?.email ?? 'Email',
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
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
                          controller: phoneTextController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.email),
                            prefixIcon: const Icon(Icons.phone, color: AppColors.grey),
                            hintText: AppLocalizations.of(context)?.phone ?? 'Phone',
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
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
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isShowPassword.value = !isShowPassword.value;
                                },
                                icon: isShowPassword.value ? const Icon(Icons.remove_red_eye) : const Icon(Icons.visibility_off)),
                            prefixIcon: const Icon(Icons.lock, color: AppColors.grey),
                            hintText: AppLocalizations.of(context)?.password ?? 'Password',
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
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
                          authNotifier.onEvent(
                            AuthEvent.registerWithEmailAndPassword(
                                context: context, email: emailTextController.text, password: passwordTextController.text, phone: phoneTextController.text, username: usernameTextController.text),
                          );
                        },
                        child: authState.loading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(color: AppColors.white),
                              )
                            : const AppText('Sign Up'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
