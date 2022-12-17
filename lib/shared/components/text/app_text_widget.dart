import 'package:elvan/shared/components/rich_text/base_text.dart';
import 'package:elvan/shared/components/rich_text/link_text.dart';
import 'package:elvan/shared/constants/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color color;
  final GestureTapCallback? onTapped;
  final int? maxLines;

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
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      text: TextSpan(children: [
        TextSpan(
          text: text,
          style: style?.merge(style).copyWith(
                color: color,
              ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (onTapped != null) onTapped!();
            },
        )
      ]),
    );
  }
}
