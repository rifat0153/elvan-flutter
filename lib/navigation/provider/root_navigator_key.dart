import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'root_navigator_key.g.dart';

@Riverpod(keepAlive: true)
class RootNavigatorKey extends _$RootNavigatorKey {
  @override
  GlobalKey<NavigatorState> build() {
    return GlobalKey<NavigatorState>();
  }
}
