import 'package:commerce_mobile/core/services/lang_service.dart';

class BarcodeProductModel {
  final String? barcode;
  final bool? isHalal;
  final Map<String, String>? name;
  final List<String>? ingredients;
  final String? halalStatus;
  final String? reason;

  BarcodeProductModel({
    this.barcode,
    this.isHalal,
    this.name,
    this.ingredients,
    this.halalStatus,
    this.reason,
  });

  // Same pattern as ProductModel.localizedTitle
  String? get localizedName => _pickLocalizedValue(
    localizedData: name,
    backendLanguageKey: LangService.currentBackendLanguageKey,
    fallbackValue: null,
  );

  factory BarcodeProductModel.fromMap(Map<String, dynamic> json) =>
      BarcodeProductModel(
        barcode: json['barcode'],
        isHalal: json['isHalal'],
        name: _toStringMap(json['name']),
        ingredients:
            json['ingredients'] != null
                ? List<String>.from(json['ingredients'])
                : [],
        halalStatus: json['halalStatus'],
        reason: json['reason'],
      );

  static Map<String, String>? _toStringMap(dynamic value) {
    if (value is! Map) return null;
    return value.map(
      (key, val) => MapEntry(key.toString(), val?.toString() ?? ''),
    );
  }

  static String? _pickLocalizedValue({
    required Map<String, String>? localizedData,
    required String backendLanguageKey,
    required String? fallbackValue,
  }) {
    final localized = localizedData?[backendLanguageKey];
    if (localized != null && localized.trim().isNotEmpty) return localized;

    final englishFallback = localizedData?['en'];
    if (englishFallback != null && englishFallback.trim().isNotEmpty) {
      return englishFallback;
    }

    return fallbackValue;
  }
}
