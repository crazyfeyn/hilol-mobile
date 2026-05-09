import 'package:commerce_mobile/core/utils/app_assets.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/models/language_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LangService {
  //assets path
  static const path = 'assets/translations';

  // Default locale
  static final locale = Locale("en", "US");

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale("en", "US");

  // Supported locales - ALL 29 LANGUAGES
  // Same order as backend language keys
  static final supportedLocales = [
    const Locale("ko", "KR"), // Korean
    const Locale("en", "US"), // English
    const Locale("uz", "UZ"), // Uzbek
    const Locale("zh", "CN"), // Chinese (Simplified)
    const Locale("vi", "VN"), // Vietnamese
    const Locale("ja", "JP"), // Japanese
    const Locale("th", "TH"), // Thai
    const Locale("ru", "RU"), // Russian
    const Locale("mn", "MN"), // Mongolian
    const Locale("id", "ID"), // Indonesian
    const Locale("fil", "PH"), // Filipino
    const Locale("ne", "NP"), // Nepali
    const Locale("km", "KH"), // Khmer (Cambodian)
    const Locale("my", "MM"), // Burmese
    const Locale("hi", "IN"), // Hindi
    const Locale("bn", "BD"), // Bengali
    const Locale("ar", "SA"), // Arabic
    const Locale("fr", "FR"), // French
    const Locale("pt", "PT"), // Portuguese
    const Locale("es", "ES"), // Spanish
    const Locale("tr", "TR"), // Turkish
    const Locale("ms", "MY"), // Malay
    const Locale("de", "DE"), // German
    const Locale("it", "IT"), // Italian
    const Locale("ta", "IN"), // Tamil
    const Locale("si", "LK"), // Sinhala
    const Locale("kk", "KZ"), // Kazakh
    const Locale("ky", "KG"), // Kyrgyz
    const Locale("uk", "UA"), // Ukrainian
  ];

  static String get currentLocale {
    final localeLang = DBService.getLanguage();
    if (localeLang == null) {
      return fallbackLocale.toStringWithSeparator(separator: "-");
    }
    return localeLang;
  }

  static String get currentBackendLanguageKey {
    final localeLang = currentLocale;
    final parts = localeLang.split('-');
    final languageCode = parts.isNotEmpty && parts.first.isNotEmpty
        ? parts.first
        : fallbackLocale.languageCode;
    return getBackendKey(languageCode);
  }

  static Locale? get initialLocale {
    final localeLang = DBService.getLanguage();
    if (localeLang == null || localeLang.isEmpty) return null;

    final parts = localeLang.split('-');
    if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    }
    if (parts.length == 1) {
      return Locale(parts[0]);
    }
    return null;
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

  static List<LanguageModel> getLanguages() {
    return supportedLocales
        .map(
          (e) => LanguageModel(
            name: langName(e.languageCode),
            icon: langIcon(e.languageCode),
            languageCode: e.languageCode,
            countryCode: e.countryCode,
          ),
        )
        .toList();
  }

  static String langName(String languageCode) {
    switch (languageCode) {
      case 'ko':
        return LocaleKeys.lang_ko.tr();
      case 'en':
        return LocaleKeys.lang_en.tr();
      case 'uz':
        return LocaleKeys.lang_uz.tr();
      case 'zh':
        return '中文';
      case 'vi':
        return 'Tiếng Việt';
      case 'ja':
        return '日本語';
      case 'th':
        return 'ภาษาไทย';
      case 'ru':
        return 'Русский';
      case 'mn':
        return 'Монгол';
      case 'id':
        return 'Bahasa Indonesia';
      case 'fil':
        return 'Filipino';
      case 'ne':
        return 'नेपाली';
      case 'km':
        return 'ភាសាខ្មែរ';
      case 'my':
        return 'မြန်မာစာ';
      case 'hi':
        return 'हिन्दी';
      case 'bn':
        return 'বাংলা';
      case 'ar':
        return 'العربية';
      case 'fr':
        return 'Français';
      case 'pt':
        return 'Português';
      case 'es':
        return 'Español';
      case 'tr':
        return 'Türkçe';
      case 'ms':
        return 'Bahasa Melayu';
      case 'de':
        return 'Deutsch';
      case 'it':
        return 'Italiano';
      case 'ta':
        return 'தமிழ்';
      case 'si':
        return 'සිංහල';
      case 'kk':
        return 'Қазақша';
      case 'ky':
        return 'Кыргызча';
      case 'uk':
        return 'Українська';
      default:
        return languageCode;
    }
  }

  static String langIcon(String languageCode) {
    switch (languageCode) {
      case 'ko':
        return AppAssets.icons.flagKo;
      case 'en':
        return AppAssets.icons.flagUs;
      case 'uz':
        return AppAssets.icons.flagUz;
      case 'zh':
        return AppAssets.icons.flagCn;
      case 'vi':
        return AppAssets.icons.flagVn;
      case 'ja':
        return AppAssets.icons.flagJp;
      case 'th':
        return AppAssets.icons.flagTh;
      case 'ru':
        return AppAssets.icons.flagRu;
      case 'mn':
        return AppAssets.icons.flagMn;
      case 'id':
        return AppAssets.icons.flagId;
      case 'fil':
        return AppAssets.icons.flagPh;
      case 'ne':
        return AppAssets.icons.flagNp;
      case 'km':
        return AppAssets.icons.flagKh;
      case 'my':
        return AppAssets.icons.flagMm;
      case 'hi':
        return AppAssets.icons.flagIn;
      case 'bn':
        return AppAssets.icons.flagBd;
      case 'ar':
        return AppAssets.icons.flagSa;
      case 'fr':
        return AppAssets.icons.flagFr;
      case 'pt':
        return AppAssets.icons.flagPt;
      case 'es':
        return AppAssets.icons.flagEs;
      case 'tr':
        return AppAssets.icons.flagTr;
      case 'ms':
        return AppAssets.icons.flagMy;
      case 'de':
        return AppAssets.icons.flagDe;
      case 'it':
        return AppAssets.icons.flagIt;
      case 'ta':
        return AppAssets.icons.flagIn; // Using India flag for Tamil
      case 'si':
        return AppAssets.icons.flagLk;
      case 'kk':
        return AppAssets.icons.flagKz;
      case 'ky':
        return AppAssets.icons.flagKg;
      case 'uk':
        return AppAssets.icons.flagUa;
      default:
        return AppAssets.icons.flagUs;
    }
  }

  // Helper method to get backend language key from locale code
  static String getBackendKey(String languageCode) {
    switch (languageCode) {
      case 'ko':
        return 'kor';
      case 'en':
        return 'en';
      case 'uz':
        return 'uz';
      case 'zh':
        return 'zh_cn';
      case 'vi':
        return 'vi';
      case 'ja':
        return 'ja';
      case 'th':
        return 'th';
      case 'ru':
        return 'ru';
      case 'mn':
        return 'mn';
      case 'id':
        return 'id';
      case 'fil':
        return 'fil';
      case 'ne':
        return 'ne';
      case 'km':
        return 'km';
      case 'my':
        return 'my';
      case 'hi':
        return 'hi';
      case 'bn':
        return 'bn';
      case 'ar':
        return 'ar';
      case 'fr':
        return 'fr';
      case 'pt':
        return 'pt';
      case 'es':
        return 'es';
      case 'tr':
        return 'tr';
      case 'ms':
        return 'ms';
      case 'de':
        return 'de';
      case 'it':
        return 'it';
      case 'ta':
        return 'ta';
      case 'si':
        return 'si';
      case 'kk':
        return 'kk';
      case 'ky':
        return 'ky';
      case 'uk':
        return 'uk';
      default:
        return 'en';
    }
  }
}
