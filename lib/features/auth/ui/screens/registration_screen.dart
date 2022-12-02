import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationScreen extends HookConsumerWidget {
  const RegistrationScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: const Text('Registration View'),
    );
  }
}
