import 'package:auto_route/auto_route.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    final _ = ref.watch(currentUserProvider);

    return auth.when(
        loading: () => const CircularProgressIndicator(),
        unKnown: () => const Center(child: Text('Unknown')),
        authenticated: (user) => Center(
              child: Column(
                children: [
                  const ElvanAppBar(title: 'Profile', showBackButton: false),

                  //circle avatar with image from user
                  const SizedBox(
                    height: AppSize.paddingMD,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.primaryRed,
                        child: CircleAvatar(
                            radius: 45,
                            //placeholder image
                            backgroundImage: NetworkImage(
                              user.imageUrl ?? 'https://picsum.photos/200',
                            )),
                      ),

                      //edit profile button
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: AppColors.primaryRed,
                            child: const Icon(
                              color: AppColors.white,
                              Icons.edit,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  AppText(
                    "${user.name}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.phone,
                        color: AppColors.white,
                      ),
                      AppText(
                        "${user.phone}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  ProfileRow(
                      icon: Icons.badge,
                      text: "Your Orders and records",
                      onTap: () {
                        context.pushRoute(const OrderRouter());
                      }),
                  ProfileRow(
                      icon: Icons.notifications,
                      text: "Notifications",
                      onTap: () {}),
                  ProfileRow(icon: Icons.phone, text: "Contacts", onTap: () {}),
                  ProfileRow(
                      icon: Icons.info,
                      text: "Terms and Conditions",
                      onTap: () {}),
                  ProfileRow(
                      icon: Icons.question_mark_rounded,
                      text: "FAQs and Support",
                      onTap: () {}),
                  ProfileRow(
                      icon: Icons.exit_to_app_outlined,
                      text: "Sign out",
                      onTap: () {
                        ref.read(authNotifierProvider.notifier).onEvent(
                              const AuthEvent.logout(),
                            );
                      }),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     context.pushRoute(const OrderRouter());
                  //   },
                  //   child: const Text('Your Orders and records'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ref.read(authNotifierProvider.notifier).onEvent(
                  //           const AuthEvent.logout(),
                  //         );
                  //   },
                  //   child: const Text('Logout'),
                  // ),
                ],
              ),
            ),
        unAuthenticated: () => Center(
                child: InkWell(
              child: const Text('Unauthenticated'),
              onTap: () {
                ref.read(authNotifierProvider.notifier).onEvent(
                      const AuthEvent.logout(),
                    );
              },
            )),
        error: (error) => const Center(child: Text('Error')));
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.iconSizeSM),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.white,
            ),
            const SizedBox(
              width: AppSize.paddingMD,
            ),
            AppText(
              text,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
