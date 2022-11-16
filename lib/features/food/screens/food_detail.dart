import 'package:elvan/navigation/root_navigator.dart';
import 'package:flutter/material.dart';

class FoooDetailScreen extends StatelessWidget {
  const FoooDetailScreen({super.key});

  _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(routeFoodListPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Food Detail Screen'),
            ElevatedButton(
              onPressed: () => _onTap(context),
              child: const Text('Navigate to Food List'),
            ),
          ],
        ),
      ),
    );
  }
}
