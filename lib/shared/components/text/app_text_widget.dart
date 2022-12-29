import 'package:flutter/material.dart';

import 'package:elvan/shared/constants/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color color;
  final GestureTapCallback? onTapped;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? letterSpacing;

  const AppText(
    this.text, {
    super.key,
    this.color = AppColors.white,
    this.style = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    this.onTapped,
    this.maxLines,
    this.textAlign,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style: style?.merge(style).copyWith(
            color: color,
            letterSpacing: letterSpacing,
          ),
    );
  }
}
