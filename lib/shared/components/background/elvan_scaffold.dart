import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/providers/statusbar_color_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ElvanScaffold extends HookConsumerWidget {
  const ElvanScaffold({
    super.key,
    required this.imagePath,
    required this.child,
    this.appBar,
    this.floatingActionButton,
  });

  final String imagePath;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      statusBarColorProvider(AppColors.primaryRed);
      return null;
    }, const []);
    return Scaffold(
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: SafeArea(
        child: ScreenBackground(
          imagePath: imagePath,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: child,
        ),
      ),
    );
  }
}
