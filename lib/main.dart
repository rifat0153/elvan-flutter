import 'package:elvan/navigation/provider/root_navigator_key.dart';
import 'package:elvan/navigation/root_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Elvan',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      navigatorKey: ref.watch(rootNavigatorKeyProvider),
      initialRoute: routeHome,
      onGenerateRoute: ongenerateRootRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
