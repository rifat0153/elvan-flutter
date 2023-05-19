import 'package:elvan/core/extensions/build_context/screen_size_ext.dart';
import 'package:elvan/shared/components/appbar/elvan_appbar.dart';
import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:elvan/shared/constants/app_asset.dart';
import 'package:elvan/shared/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyCartScreen extends HookConsumerWidget {
  const EmptyCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight,
      child: Column(
        children: [
          ElvanAppBar(title: AppLocalizations.of(context)!.yourCart),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAsset.emptyCart, height: 300),
                AppText(AppLocalizations.of(context)?.sorry ?? "Sorry!", style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: AppSize.kPadding),
                AppText(AppLocalizations.of(context)?.cartEmpty ?? "Your cart is empty", style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
