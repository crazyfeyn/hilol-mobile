import 'package:commerce_mobile/presentation/pages/cart/page/cart_page.dart';
import 'package:commerce_mobile/presentation/pages/home/page/home_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_assets.dart';
import 'package:svg_flutter/svg.dart';

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
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 2),
          ],
          gradient: LinearGradient(
            colors: [AppColors.red300, AppColors.red300],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.icons.home,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 0
                        ? const Color(0xFF4A4A4A)
                        : AppColors.white50,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.icons.cart,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 1
                        ? const Color(0xFF4A4A4A)
                        : AppColors.white50,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppAssets.icons.person,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 2
                        ? const Color(0xFF4A4A4A)
                        : AppColors.white50,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Profile',
              ),
            ],
            selectedItemColor: const Color(0xFF4A4A4A),
            unselectedItemColor: AppColors.white50,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedFontSize: 13,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
