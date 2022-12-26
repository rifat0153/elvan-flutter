import 'package:elvan/shared/components/background/screen_background.dart';
import 'package:flutter/material.dart';

class ElvanScaffold extends StatelessWidget {
  const ElvanScaffold({
    super.key,
    required this.imagePath,
    required this.child,
  });

  final String imagePath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
