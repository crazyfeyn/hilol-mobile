import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/presentation/pages/address/page/address_page.dart';
import 'package:commerce_mobile/presentation/pages/address/page/location_image.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/page/confirm_code_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/forget_pass/page/forget_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/reset_pass/page/reset_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_up/page/sign_up_page.dart';
import 'package:commerce_mobile/presentation/pages/cart/cart/page/cart_page.dart';
import 'package:commerce_mobile/presentation/pages/my_order/page/my_order_page.dart';
import 'package:commerce_mobile/presentation/pages/payment/page/payment_page.dart';
import 'package:commerce_mobile/presentation/pages/home/details/page/details_page.dart';
import 'package:commerce_mobile/presentation/pages/home/home/page/home_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/page/edit_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/page/profile_page.dart';
import 'package:commerce_mobile/presentation/pages/splash/page/splash_page.dart';
import 'package:commerce_mobile/presentation/widgets/main_bottom_navigation_bar.dart';
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
        pageBuilder:
            (context, state) => MaterialPage(
              child: ConfirmCodePage(
                extra: state.extra as Map<String, dynamic>,
              ),
            ),
      ),
      GoRoute(
        path: ForgetPassPage.path,
        pageBuilder:
            (context, state) => const MaterialPage(child: ForgetPassPage()),
      ),
      GoRoute(
        path: ResetPasswordPage.path,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return MaterialPage(
            child: ResetPasswordPage(phoneNumber: extra['phoneNumber']),
          );
        },
      ),

      ShellRoute(
        builder: (context, state, child) {
          return MainBottomNavigationBar(
            currentPath: state.uri.path,
            key: state.pageKey,
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: HomePage.path,
            pageBuilder:
                (context, state) => const MaterialPage(child: HomePage()),
          ),
          GoRoute(
            path: CartPage.path,
            pageBuilder:
                (context, state) => const MaterialPage(child: CartPage()),
          ),
          GoRoute(
            path: ProfilePage.path,
            pageBuilder: (context, state) => const MaterialPage(child: ProfilePage()),
            routes: [
              GoRoute(
                path: MyOrderPage.path,
                pageBuilder: (context, state) => MaterialPage(child: MyOrderPage()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: ProductDetailsPage.path,
        pageBuilder:
            (context, state) => MaterialPage(
              child: ProductDetailsPage(
                extra: state.extra as Map<String, dynamic>,
              ),
            ),
      ),
      GoRoute(
        path: EditPage.path,
        pageBuilder: (context, state) => const MaterialPage(child: EditPage()),
      ),
      // GoRoute(
      //   path: OrderHistoryPage.path,
      //   pageBuilder:
      //       (context, state) => const MaterialPage(child: OrderHistoryPage()),
      // ),

      // GoRoute(
      //   path: OrderProductModelDetailPage.path,
      //   pageBuilder: (context, state) {
      //     final extra = state.extra as Map<String, dynamic>;
      //     return MaterialPage(
      //       child: OrderProductModelDetailPage(
      //         product: extra['product'],
      //         order: extra['order'],
      //       ),
      //     );
      //   },
      // ),
      GoRoute(
        path: SignUpPage.path,
        pageBuilder:
            (context, state) => const MaterialPage(child: SignUpPage()),
      ),

      GoRoute(
        path: AddressPage.path,
        pageBuilder:
            (context, state) => MaterialPage(
              child: AddressPage(carts: state.extra as List<CartModel>),
            ),
      ),
      GoRoute(
        path: LocationImagePage.path,
        pageBuilder:
            (context, state) => MaterialPage(
              child: LocationImagePage(orderData: state.extra as OrderData),
            ),
      ),
      GoRoute(
        path: PaymentPage.path,
        pageBuilder:
            (context, state) => MaterialPage(
              child: PaymentPage(order: state.extra as OrderData),
            ),
      ),
      GoRoute(
        path: MyOrderPage.path,
        pageBuilder: (context, state) => MaterialPage(child: MyOrderPage()),
      ),
    ],
  );

  AppRouter._();
}
