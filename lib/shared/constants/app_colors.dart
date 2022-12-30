import 'dart:ui';

import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';

@immutable
class AppColors {
  const AppColors._();

  static const primaryRed = Color(0xFFE31640);

  static const black = Color(0xFF000000);
  static const black_10 = Color.fromRGBO(0, 0, 0, 0.1);

  static const white = Color(0xFFFFFFFF);
  static const white_15 = Color.fromRGBO(255, 255, 255, 0.15);

  // static const grey = Color(0xFF686868);
  static const grey = Colors.grey;
  static const grey_70 = Color.fromRGBO(104, 104, 104, 0.3);
  static const lightGray = Color(0xFFA7A7A7);

  static const primaryTextColor = Color(0xFF212121);
  static const secondaryTextColor = Color(0xFF757575);

  static const dividerColor = Color(0xFFBDBDBD);

  static const errorTextColor = Color(0xFFB00020);
}
