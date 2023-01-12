import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/app/router/navigator_provider.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';

class ElvanAppBar extends HookConsumerWidget with PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  const ElvanAppBar({
    required this.title,
    this.bottom,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      // toolbarHeight: 120,
      // flexibleSpace: bottom,

      bottom: bottom,
      backgroundColor: AppColors.primaryRed,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => ref.read(navigatorProvider.notifier).pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
      ),
      title: AppText(title),
    );
  }
}
