import 'package:commerce_mobile/config/router/app_router.dart';
import 'package:commerce_mobile/config/theme/app_theme.dart';
import 'package:commerce_mobile/core/services/environment_service.dart';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/services/session_service.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '81ea026e7609e8ce87ace191465a40db',
    javaScriptAppKey: '8fdaaf1c7caf708637319641cd648590',
  );

  AuthRepository.initialize(appKey: '8fdaaf1c7caf708637319641cd648590');

  await EnvironmentService.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DBService.ensureInitialized();
  SessionService.bootstrap();

  FlutterError.onError = (details) {
    if (details.exception.toString().contains('KeyUpEvent') ||
        details.exception.toString().contains('_pressedKeys.containsKey')) {
      return;
    }
    FlutterError.presentError(details);
  };

  runApp(
    EasyLocalization(
      path: LangService.path,
      startLocale: LangService.initialLocale,
      fallbackLocale: LangService.fallbackLocale,
      supportedLocales: LangService.supportedLocales,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      SessionService.clearGuestSessionOnExitIfUnauthenticated();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: MaterialApp.router(
        title: tr(LocaleKeys.app_name),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: AppTheme.appTheme,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        scaffoldMessengerKey: GlobalSnackBar.scaffoldMessengerKey,
        builder: (context, child) {
          final widget = MediaQuery(
            // ignore: deprecated_member_use
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );

          if (kDebugMode) return OverlaySupport(child: widget);
          return widget;
        },
      ),
    );
  }
}
