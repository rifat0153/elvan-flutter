import 'package:elvan/navigation/app_routes.dart';
import 'package:elvan/navigation/provider/root_navigator_key.dart';
import 'package:elvan/navigation/navigators/root_navigator.dart';
import 'package:elvan/shared/components/constants/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(AppColors.primaryColor),
    ),
  );
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
          fontFamily: 'Poppins'),
      navigatorKey: ref.watch(rootNavigatorKeyProvider),
      initialRoute: AppRoute.routeHome,
      onGenerateRoute: ongenerateRootRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
