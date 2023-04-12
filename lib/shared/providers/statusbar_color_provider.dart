import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final statusBarColorProvider = Provider.family<void, Color>((ref, color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: color,
      //or set color with: Color(0x57646475)
      statusBarIconBrightness: Brightness.dark));
});
