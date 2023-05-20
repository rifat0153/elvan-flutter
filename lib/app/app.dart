import 'package:elvan/shared/constants/app_colors.dart';
import 'package:elvan/shared/providers/scaffold_messenger/scaffold_messenger_key_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:elvan/app/router/app_router.dart';
import 'package:elvan/app/router/app_router.gr.dart';
import 'package:elvan/core/logger/colored_print_log.dart';
import 'package:elvan/features/auth/providers/auth_providers.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authStateProvider, (_, next) {
      debugPrint('currentUserProvider listen:  next: ${next.value?.uid}');

      debugPrint('OnChange: -> Root key -> ${ref.read(appRouterProvider).key}');
      debugPrint('OnChange: ->  Curr key -> ${ref.read(appRouterProvider).current.key}');

      debugPrint('OnChange: -> Current router path -> ${ref.read(appRouterProvider).current.path}');

      final currrentPath = ref.read(appRouterProvider).current.path;
      logWarning('OnChange: Auth State Changed -> curr path -> $currrentPath');

      if (next.value != null) {
        debugPrint('OnChange: BottomTabRoute');

        if (currrentPath == '') {
          logInfo('OnChange: Tab -----> Push');
          ref.read(appRouterProvider).push(const BottomTabRouter());
        } else {
          logInfo('OnChange: Tab -----> ReplaceAll');
          ref.read(appRouterProvider).replaceAll([const BottomTabRouter()]);
        }
      } else {
        logInfo('OnChange: Auth -----> ReplaceAll');
        final stack = ref.read(appRouterProvider).canNavigateBack;
        logInfo('OnChange: Auth -----> stack: $stack');

        ref.read(appRouterProvider).replaceAll([const AuthRouter()]);
      }
    });

    final scaffoldMessengerKey = ref.watch(scaffoldMessengerKeyProvider);
    final appRouter = ref.watch(appRouterProvider);

    // TODO: Remove this lines
    // final currentUser = ref.watch(currentUserProvider);
    // final loggedIn = currentUser != null;
    // final authState = ref.watch(authNotifierProvider.notifier);
    // print('isAuthenticated loggedIn -> in MYAPP  -> : ${authState.isAuthenticated}');
    // print('loggedIn -> in MYAPP -> : $loggedIn');

    return ScreenUtilInit(
      designSize: const Size(400, 1000),
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          scaffoldMessengerKey: scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          title: 'Elvan',
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(includePrefixMatches: true),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('sv', ''), // Swedish, no country code
          ],
          locale: const Locale('sv', ''),
          theme: ThemeData(
              primarySwatch: Colors.pink,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  //<-- SEE HERE
                  // Status bar color
                  statusBarColor: AppColors.primaryRed,
                  statusBarIconBrightness: Brightness.dark,
                  statusBarBrightness: Brightness.light,
                ),
              )),
        );
      },
    );
  }
}
