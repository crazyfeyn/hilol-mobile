// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

import 'package:commerce_mobile/core/services/lang_service.dart';

ProductModel productModelFromMap(String str) => ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  final int? id;
  final int? categoryId;
  final String? title;
  final List<String>? images;
  final String? description;
  final String? brand;
  final int? amount;
  final String? currency;
  final double? price;
  final int? measurementId;
  final Map<String, String>? titleData;
  final Map<String, String>? descriptionData;

  ProductModel({
    this.id,
    this.categoryId,
    this.title,
    this.images,
    this.description,
    this.brand,
    this.amount,
    this.currency,
    this.price,
    this.measurementId,
    this.titleData,
    this.descriptionData,
  });

  ProductModel copyWith({
    int? id,
    int? categoryId,
    String? title,
    List<String>? images,
    String? description,
    String? brand,
    int? amount,
    String? currency,
    double? price,
    int? measurementId,
    Map<String, String>? titleData,
    Map<String, String>? descriptionData,
  }) =>
      ProductModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        images: images ?? this.images,
        description: description ?? this.description,
        brand: brand ?? this.brand,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        price: price ?? this.price,
        measurementId: measurementId ?? this.measurementId,
        titleData: titleData ?? this.titleData,
        descriptionData: descriptionData ?? this.descriptionData,
      );

  String? get localizedTitle => _pickLocalizedValue(
        localizedData: titleData,
        backendLanguageKey: LangService.currentBackendLanguageKey,
        fallbackValue: title,
      );

  String? get localizedDescription => _pickLocalizedValue(
        localizedData: descriptionData,
        backendLanguageKey: LangService.currentBackendLanguageKey,
        fallbackValue: description,
      );

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    final parsedTitleData = _toStringMap(json["titleData"]);
    final parsedDescriptionData = _toStringMap(json["descriptionData"]);

    return ProductModel(
      id: json["id"],
      categoryId: json["categoryId"],
      title: json["title"]?.toString(),
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      description: json["description"]?.toString(),
      brand: json["brand"],
      amount: json["amount"],
      currency: json["currency"],
      price: double.tryParse(json["price"]?.toString() ?? ""),
      measurementId: json["measurementId"],
      titleData: parsedTitleData,
      descriptionData: parsedDescriptionData,
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "categoryId": categoryId,
    "title": title,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "description": description,
    "brand": brand,
    "amount": amount,
    "currency": currency,
    "price": price,
    "measurementId": measurementId,
    "titleData": titleData,
    "descriptionData": descriptionData,
  };

  static Map<String, String>? _toStringMap(dynamic value) {
    if (value is! Map) return null;
    return value.map(
      (key, val) => MapEntry(key.toString(), val?.toString() ?? ""),
    );
  }

  static String? _pickLocalizedValue({
    required Map<String, String>? localizedData,
    required String backendLanguageKey,
    required String? fallbackValue,
  }) {
    final localized = localizedData?[backendLanguageKey];
    if (localized != null && localized.trim().isNotEmpty) {
      return localized;
    }

    final englishFallback = localizedData?["en"];
    if (englishFallback != null && englishFallback.trim().isNotEmpty) {
      return englishFallback;
    }

    return fallbackValue;
  }
}
