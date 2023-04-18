import 'package:auto_route/auto_route.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';
import 'package:elvan/features/profile/ui/notifier/profile_notifier.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:elvan/shared/providers/package_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(profileNotifierProvider);
    final _ = ref.watch(currentUserProvider);
    final version = ref.watch(versionProvider);

    return auth.when(
        loading: () => const Center(
            child: SizedBox(
                height: 40, width: 40, child: CircularProgressIndicator())),
        unKnown: () => const Center(child: Text('Unknown')),
        authenticated: (user) => Center(
              child: Column(
                children: [
                  // ElvanAppBar(
                  //     title: AppLocalizations.of(context)!.profile,
                  //     showBackButton: false),

                  //circle avatar with image from user
                  const SizedBox(
                    height: AppSize.paddingMD,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.primaryRed,
                        child: Builder(builder: (context) {
                          if (user.imageUrl == null) {
                            return CircleAvatar(
                                radius: 45,
                                //placeholder image
                                child: Image.asset(
                                  AppAsset.user,
                                  color: AppColors.black,
                                  width: 60,
                                  height: 60,
                                ));
                          }
                          return CircleAvatar(
                              radius: 45,
                              //placeholder image
                              backgroundImage: NetworkImage(
                                user.imageUrl ?? 'https://picsum.photos/200',
                              ));
                        }),
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

                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: AppText(
                      "${user.name}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),

                  user.phone == null
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: AppColors.white,
                              size: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: AppText(
                                "${user.phone}",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  ProfileRow(
                      icon: Icons.badge,
                      text: AppLocalizations.of(context)!.yourOrderAndRecords,
                      onTap: () {
                        context.pushRoute(const OrderRouter());
                      }),
                  ProfileRow(
                      icon: Icons.notifications,
                      text: AppLocalizations.of(context)!.notifications,
                      onTap: () {}),
                  ProfileRow(icon: Icons.phone, text: "Contacts", onTap: () {}),
                  ProfileRow(
                      icon: Icons.info,
                      text: AppLocalizations.of(context)!.termsAndConditions,
                      onTap: () {}),
                  ProfileRow(
                      icon: Icons.question_mark_rounded,
                      text: AppLocalizations.of(context)!.faqAndSupport,
                      onTap: () {}),
                  ProfileRow(
                      icon: Icons.exit_to_app_outlined,
                      text: AppLocalizations.of(context)!.signOut,
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
                  const Spacer(),
                  version.when(
                    data: (data) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AppText("v $data"),
                          )
                        ],
                      );
                    },
                    error: (error, stackTrace) => Container(),
                    loading: () => Container(),
                  )
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
        error: (error) => const Center(
            child: AppText('Error', style: TextStyle(color: AppColors.white))));
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
