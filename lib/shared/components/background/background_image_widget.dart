import 'package:elvan/shared/constants/app_asset.dart';
import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  const BackgroundImageWidget({
    super.key,
    required this.child,
    required this.imagePath,
  });

  final Widget child;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAsset.homeBackgroundPng),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
