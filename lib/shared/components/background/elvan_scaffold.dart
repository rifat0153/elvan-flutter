import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:flutter/material.dart';

class ElvanScaffold extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
