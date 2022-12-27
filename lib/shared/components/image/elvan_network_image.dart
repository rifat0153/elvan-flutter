import 'package:flutter/material.dart';

class ElvanNetworkImage extends StatelessWidget {
  const ElvanNetworkImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Image.asset(
        // TODO: Add a placeholder image
        'assets/images/food_placeholder.png',
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
