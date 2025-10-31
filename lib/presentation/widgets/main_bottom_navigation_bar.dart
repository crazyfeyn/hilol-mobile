import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/cart/cart/page/cart_page.dart';
import 'package:commerce_mobile/presentation/pages/home/home/page/home_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/page/profile_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final Widget body;
  final String currentPath;

  const MainBottomNavigationBar({
    super.key,
    required this.body,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex = onCurrentIndex();
    return Scaffold(
      body: body,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white50,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              offset: Offset(0, -2),
              blurRadius: 12,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            final path = onNavigationPath(currentIndex, index);
            if (path != null) NavigationService.go(context, path);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_grid_2x2_fill, size: 24),
              label: context.tr(LocaleKeys.nav_home),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart_fill, size: 24),
              label: context.tr(LocaleKeys.nav_cart),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_fill, size: 24),
              label: context.tr(LocaleKeys.nav_profile),
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  int onCurrentIndex() {
    return switch (currentPath) {
      final p when p.startsWith(HomePage.path) => 0,
      final p when p.startsWith(CartPage.path) => 1,
      final p when p.startsWith(ProfilePage.path) => 2,
      _ => 0,
    };
  }

  String? onNavigationPath(int currentIndex, int index) {
    if (currentIndex == index) return null;
    return switch (index) {
      0 => HomePage.path,
      1 => CartPage.path,
      2 => ProfilePage.path,
      _ => HomePage.path,
    };
  }
}
