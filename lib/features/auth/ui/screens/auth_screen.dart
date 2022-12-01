import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthScreen extends HookConsumerWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textContrller = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('AuthScreen'),
        ),
      ),
    );
  }
}
