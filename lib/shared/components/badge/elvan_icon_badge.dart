import 'package:elvan/shared/components/text/app_text_widget.dart';
import 'package:flutter/material.dart';

class ElvanIconBadge extends StatelessWidget {
  const ElvanIconBadge({
    super.key,
    required this.icon,
    required this.count,
    this.onPressed,
  });

  final Icon icon;
  final int count;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          IconButton(onPressed: onPressed, icon: icon),
          if (count > 0)
            Positioned(
              right: 6,
              top: 5,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                constraints: const BoxConstraints(
                  minWidth: 14,
                  minHeight: 14,
                ),
                child: AppText(
                  '$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
