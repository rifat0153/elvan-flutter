import 'dart:math';

import 'package:flutter/material.dart';

extension ScreenSizeExt on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenMin => min(screenWidth, screenHeight);
  double get screenMax => max(screenWidth, screenHeight);
}
