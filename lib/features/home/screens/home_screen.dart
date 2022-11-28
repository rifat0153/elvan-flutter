import 'package:elvan/navigation/root_navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text(
            'HomeView',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.5),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed(routeFoodStart),
            child: const Text('Navigate to Food Navigator'),
          ),
        ],
      ),
    );
  }
}
