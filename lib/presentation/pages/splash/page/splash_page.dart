import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/home/main/page/main_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String path = "/splash_page";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void onNavigation(value) {
    if (DBService.getAccessToken().isNotEmpty) {
      NavigationService.go(context, MainPage.path);
    } else {
      NavigationService.go(context, SignInPage.path);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then(onNavigation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primary500);
  }
}
