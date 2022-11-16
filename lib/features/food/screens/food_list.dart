import 'package:elvan/navigation/root_navigator.dart';
import 'package:flutter/material.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({super.key});

  _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(routeFoodDetailPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Food List Screen'),
            ElevatedButton(
              onPressed: () => _onTap(context),
              child: const Text('Navigate to Food Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
