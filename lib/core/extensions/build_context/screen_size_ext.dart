import 'dart:math';

import 'package:flutter/material.dart';

extension ScreenSizeExt on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenMin => min(screenWidth, screenHeight);
  double get screenMax => max(screenWidth, screenHeight);

  double screenMinPercent(double percent) => screenMin * percent;
  double screenMaxPercent(double percent) => screenMax * percent;

  double screenHeightPercent(double percent) => screenHeight * percent;
  double screenWidthPercent(double percent) => screenWidth * percent;

  double get screenRatio => screenWidth / screenHeight;
  double get screenRatioInverted => screenHeight / screenWidth;

  double get screenDiagonal => sqrt(pow(screenWidth, 2) + pow(screenHeight, 2));
}
