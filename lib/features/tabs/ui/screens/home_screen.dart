// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:elvan/core/custom_sliver_list/custom_sliver_list.dart';
import 'package:elvan/features/category/ui/screens/category_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

double _calculate([int end = 300000000]) {
  double x = 0;
  for (var i = 0; i < end; i++) {
    x += i;
  }
  return x;
}

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static Future<double> heavyCalculation() async {
    double x = 0;
    x = await compute(_calculate, 500000000);
    debugPrint('Heavy Calculation Done $x');
    return x;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: CustomSliverList(
              isPrimary: true,
              nestedWidgetList: [
                [
                  Text(
                    'Home Screen',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
                for (var i = 0; i < 50; i++)
                  [
                    const CategoryList(),
                    const SizedBox(height: 20),
                  ],
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              heavyCalculation();
            },
            child: const Text('Heavy Calculation'),
          ),
        ],
      ),
    );
  }
}
