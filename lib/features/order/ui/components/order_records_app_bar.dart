import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:elvan/app/router/navigator_provider.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_colors.dart';

class OrderRecordsAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const OrderRecordsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: AppColors.primaryRed,
      centerTitle: true,
      leading: IconButton(
        onPressed: () => ref.read(navigatorProvider.notifier).pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
      ),
      title: const AppText('Order Records'),
    );
  }
}
