import 'package:commerce_mobile/presentation/pages/auth/confirm_code/page/confirm_code_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/forget_pass/page/forget_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/reset_pass/page/reset_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_up/page/sign_up_page.dart';
import 'package:commerce_mobile/presentation/pages/home/page/home_page.dart';
import 'package:commerce_mobile/presentation/pages/home/page/main_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/page/edit_page.dart';
import 'package:commerce_mobile/presentation/pages/splash/page/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'navigation_service.dart';

class AppRouter {
  static final router = GoRouter(
    observers: [NavigationService.routeObserver],
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: SplashPage.path,
    routes: [
      GoRoute(
        path: SplashPage.path,
        pageBuilder:
            (context, state) => const MaterialPage(child: SplashPage()),
      ),
      GoRoute(
        path: SignInPage.path,
        pageBuilder:
            (context, state) => const MaterialPage(child: SignInPage()),
      ),
      GoRoute(
        path: SignUpPage.path,
        pageBuilder:
            (context, state) => const MaterialPage(child: SignUpPage()),
      ),
      GoRoute(
        path: ConfirmCodePage.path,
        pageBuilder: (context, state) => MaterialPage(child: ConfirmCodePage(extra: state.extra as Map<String, dynamic>)),
      ),
      GoRoute(
        path: ForgetPassPage.path,
        pageBuilder:
            (context, state) => const MaterialPage(child: ForgetPassPage()),
      ),
      GoRoute(
        path: ResetPasswordPage.path,
        pageBuilder:
            (context, state) => const MaterialPage(child: ResetPasswordPage()),
      ),
      GoRoute(
        path: HomePage.path,
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
      GoRoute(
        path: MainPage.path,
        pageBuilder: (context, state) => const MaterialPage(child: MainPage()),
      ),
      GoRoute(
        path: EditPage.path,
        pageBuilder: (context, state) => const MaterialPage(child: EditPage()),
      ),
    ],
  );

  AppRouter._();
}
