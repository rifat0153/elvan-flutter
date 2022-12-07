import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvan/core/router/router.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

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
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.white,
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: Color(AppColors.primaryColor));
            }
            return const IconThemeData(color: Colors.white);
          }),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              displayColor: Colors.white,
              bodyColor: const Color(AppColors.textGreyA7),
            ),
        useMaterial3: true,
      ),
      // routerDelegate: router.routerDelegate,
      // routeInformationParser: router.routeInformationParser,
      routerConfig: router,
    );
  }
}
