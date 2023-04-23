import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:flutter/material.dart';

class ElvanSafeRemoveScaffold extends StatelessWidget {
  const ElvanSafeRemoveScaffold({
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: appBar,
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        imagePath: imagePath,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: child,
      ),
    );
  }
}
