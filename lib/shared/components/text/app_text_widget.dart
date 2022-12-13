import 'package:elvan/shared/components/rich_text/base_text.dart';
import 'package:elvan/shared/components/rich_text/link_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color color;
  final GestureTapCallback? onTapped;

  const AppText(
    this.text, {
    super.key,
    this.color = Colors.black,
    this.style,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
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
