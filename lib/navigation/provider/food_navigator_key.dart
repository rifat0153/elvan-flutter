import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'food_navigator_key.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> foodNavigatorKey(
  FoodNavigatorKeyRef ref,
) =>
    GlobalKey<NavigatorState>();
