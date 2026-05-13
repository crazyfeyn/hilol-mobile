import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/payment_method_model.dart';
import 'package:flutter/cupertino.dart';

class AppConstants {
  // App/Play store IDs
  static const String androidID = '';
  static const String iosId = '';

  // BaseUrls
  static const String baseUrl = 'http://131.153.18.44:8080/api/v1/client/';

  // Toss Payments redirect URLs (intercepted by WebView before the server sees them)
  static const String tossPaymentSuccessUrl =
      'https://hilol-market.kr/api/v1/toss/success';
  static const String tossPaymentFailUrl =
      'https://hilol-market.kr/api/v1/toss/fail';

  // App/Play store urls
  static const String appStore =
      'https://apps.apple.com/kr/app/hilol-market/id6764551915?l=en-GB';
  static const String playStore =
      'https://play.google.com/store/apps/details?id=kr.hilolMarket.mobile&hl=en';

  static int confirmCodeSeconds = 120;

  /// Fixed delivery fee in KRW (₩1 for testing).
  static const double fixedDeliveryFeeKrw = 1.0;

  // Support, Terms and privacy link
  static const String support =
      'https://play.google.com/store/apps/details?id=com.otashqassob&hl=en';
  static const String privacyPolice =
      'https://play.google.com/store/apps/details?id=com.otashqassob&hl=en';
  static const String termsOfServices =
      'https://play.google.com/store/apps/details?id=com.otashqassob&hl=en';

  static List<PaymentMethodModel> paymentMethods = [
    PaymentMethodModel(
      method: PaymentMethod.tossBank,
      icon: CupertinoIcons.creditcard,
      title: "toss_bank",
      isSoon: false,
    ),
    // PaymentMethodModel(
    //   method: PaymentMethod.cash,
    //   icon: CupertinoIcons.creditcard,
    //   title: "cash",
    //   isSoon: true,
    // ),
  ];
  const AppConstants._();
}

enum Status {
  initial,
  error,
  success,
  loading,
  errorNetwork,
  profileLoading,
  imageLoading,
  adLoading,
}
