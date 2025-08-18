import 'package:commerce_mobile/presentation/pages/home/page/home_page.dart';
import 'package:commerce_mobile/presentation/pages/home/page/main_page.dart';
import 'package:commerce_mobile/presentation/pages/splash/page/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'navigation_service.dart';

class AppRouter {
  static final router = GoRouter(
    observers: [NavigationService.routeObserver],
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: MainPage.path,
    routes: [
      GoRoute(
        path: SplashPage.path,
        pageBuilder:
            (context, state) => const MaterialPage(child: SplashPage()),
      ),
      GoRoute(
        path: HomePage.path,
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
      GoRoute(
        path: MainPage.path,
        pageBuilder: (context, state) => const MaterialPage(child: MainPage()),
      ),
    ],
  );

  AppRouter._();
}
