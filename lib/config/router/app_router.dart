import 'package:commerce_mobile/presentation/pages/splash/page/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'navigation_service.dart';

class AppRouter {

  static final router = GoRouter(
    observers: [ NavigationService.routeObserver ],
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: SplashPage.path,
    routes: [
      GoRoute(
        path: SplashPage.path,
        pageBuilder: (context, state) => const MaterialPage(child: SplashPage()),
      ),
    ],
  );

  AppRouter._();
}