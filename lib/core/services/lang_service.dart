import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LangService {
  //assets path
  static const path = 'assets/translations';

  // Default locale
  static final locale = Locale('uz', 'UZ');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('uz', 'UZ');

  // Supported locales
  // Needs to be same order with languages
  static final supportedLocales = [const Locale('uz', 'UZ')];

  static String get currentLocale {
    final localeLang = DBService.getLanguage();
    if(localeLang == null) return fallbackLocale.toStringWithSeparator(separator: "-");
    return localeLang;
  }

  // Gets locale from language, and updates the locale
  static void changeLocale(BuildContext context, String langCode) {
    final result = supportedLocales.firstWhere(
      (e) => e.languageCode == langCode,
      orElse: () => supportedLocales.first,
    );
    context.setLocale(result);
    DBService.setLanguage(result.toStringWithSeparator(separator: "-"));
  }
}
