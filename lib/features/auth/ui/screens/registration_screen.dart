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

class RegistrationScreen extends HookConsumerWidget {
  const RegistrationScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);
    // final isAuthenticated = ref.read(
    //   authNotifierProvider.notifier.select((v) => v.isAuthenticated),
    // );

    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final phoneTextController = useTextEditingController();
    final usernameTextController = useTextEditingController();

    // final currentRoute = ref.read(appRouterProvider).current.path;

    return
        // appBar: AppBar(
        //   title: Text('Auth $isAuthenticated '),
        // ),
        ElvanScaffold(
      imagePath: AppAsset.homeBackgroundPng,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // A('Registration Screen'),
          ElvanAppBar(title: "Registration"),
          // const Text('Auth Screen'),
          // Text('Current Route --> $currentRoute'),
          authState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            unKnown: () => const Center(child: Text('Unknown')),
            unAuthenticated: () => Padding(
              padding: const EdgeInsets.all(AppSize.paddingLG),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //asset image
                  Image.asset(
                    AppAsset.redLogo,
                    width: 200,
                    height: 200,
                  ),
                  TextField(
                    controller: usernameTextController,
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.email),
                      prefixIcon: Icon(Icons.person, color: AppColors.grey),
                      hintText: 'Username',
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
                  TextField(
                    controller: emailTextController,
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.email),
                      prefixIcon: Icon(Icons.email, color: AppColors.grey),
                      hintText: 'Email',
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
                  TextField(
                    controller: phoneTextController,
                    decoration: const InputDecoration(
                      // icon: Icon(Icons.email),
                      prefixIcon: Icon(Icons.phone, color: AppColors.grey),
                      hintText: 'Phone',
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
                  TextField(
                    controller: passwordTextController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: AppColors.grey),
                      hintText: 'Password',
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
                      authNotifier.onEvent(
                        AuthEvent.registerWithEmailAndPassword(
                          email: emailTextController.text,
                          password: passwordTextController.text,
                        ),
                      );
                      //set username and phone
                      // authNotifier.authUseCase.setUserUseCase(
                      //     userId: " ",
                      //     elvanUser: ElvanUser(
                      //       name: usernameTextController.text,
                      //       phone: phoneTextController.text,
                      //     ));
                    },
                    child: const AppText('Sign Up'),
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
