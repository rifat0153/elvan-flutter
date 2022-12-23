import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent.withOpacity(0.2),
        child: const Center(child: Text('Not Found View')),
      ),
    );
  }
}
