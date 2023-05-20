import 'package:flutter/services.dart';

void statusBarColorProvider(color) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color, statusBarIconBrightness: Brightness.dark, systemNavigationBarColor: color));
}
