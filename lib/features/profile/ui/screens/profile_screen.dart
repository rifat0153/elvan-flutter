import 'package:auto_route/auto_route.dart';
import 'package:elvan/core/router/app_router.gr.dart';
import 'package:elvan/features/auth/ui/notifier/auth_notifier.dart';
import 'package:elvan/features/auth/ui/state/auth_event.dart';
import 'package:elvan/features/category/domain/models/category/category.dart';
import 'package:elvan/features/category/ui/notifier/category_notifier.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(categoryNotifierProvider);

    return Center(
      child: Column(
        children: [
          AppText('Category List: ${categoryList.data?.length}'),
          for (final category in categoryList.data ?? <Category>[])
            for (final bs in category.buildSteps)
              AppText(
                bs.title,
              ),
          const AppText('Profile'),
          ElevatedButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).onEvent(
                    const AuthEvent.logout(),
                  );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
