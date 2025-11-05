import 'package:commerce_mobile/config/router/app_router.dart';
import 'package:commerce_mobile/config/theme/app_theme.dart';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '81ea026e7609e8ce87ace191465a40db',
    javaScriptAppKey: '0401dbed276524d9b1885fed94f33c8a',
  );

  AuthRepository.initialize(appKey: '0401dbed276524d9b1885fed94f33c8a');

  await EasyLocalization.ensureInitialized();
  await DBService.ensureInitialized();

  FlutterError.onError = (details) {
    if (details.exception.toString().contains('KeyUpEvent') ||
        details.exception.toString().contains('_pressedKeys.containsKey')) {
      // Ignore keyboard assertion errors
      print('Keyboard assertion error caught: ${details.exception}');
      return;
    }
    FlutterError.presentError(details);
  };

  runApp(
    EasyLocalization(
      path: LangService.path,
      startLocale: LangService.fallbackLocale,
      fallbackLocale: LangService.fallbackLocale,
      supportedLocales: LangService.supportedLocales,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: MaterialApp.router(
        title: 'E-commerce',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: AppTheme.appTheme,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        scaffoldMessengerKey: GlobalSnackBar.scaffoldMessengerKey,
        builder: (context, child) {
          return MediaQuery(
            // ignore: deprecated_member_use
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      ),
    );
  }
}
