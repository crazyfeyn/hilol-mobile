import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/presentation/pages/cart/page/cart_page.dart';
import 'package:commerce_mobile/presentation/pages/home/page/home_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/page/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const String path = "/main_page";
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // disable swipe
        children: const [HomePage(), CartPage(), ProfilePage()],
      ),
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
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
            _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart, size: 24),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person, size: 24),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
