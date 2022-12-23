import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({
    super.key,
    required this.imagePath,
    required this.child,
    this.width,
    this.height,
  });

  final String? imagePath;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath ?? AppAsset.homeBackgroundPng),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
