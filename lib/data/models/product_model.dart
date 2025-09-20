import 'package:commerce_mobile/data/models/title_data_model.dart';

class ProductModel {
  final int id;
  final int categoryId;
  final String title;
  final TitleData titleData;
  final List<String> images;
  final String description;
  final String brand;
  final int amount;
  final String currency;
  final double price;
  final int measurementId;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.titleData,
    required this.images,
    required this.description,
    required this.brand,
    required this.amount,
    required this.currency,
    required this.price,
    required this.measurementId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      categoryId: json['categoryId'] ?? 0,
      title: json['title'] ?? '',
      titleData: TitleData.fromJson(json['titleData'] ?? {}),
      images: List<String>.from(json['images'] ?? []),
      description: json['description'] ?? '',
      brand: json['brand'] ?? '',
      amount: json['amount'] ?? 0,
      currency: json['currency'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      measurementId: json['measurementId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'title': title,
      'titleData': titleData.toJson(),
      'images': images,
      'description': description,
      'brand': brand,
      'amount': amount,
      'currency': currency,
      'price': price,
      'measurementId': measurementId,
    };
  }

  ProductModel copyWith({
    int? id,
    int? categoryId,
    String? title,
    TitleData? titleData,
    List<String>? images,
    String? description,
    String? brand,
    int? amount,
    String? currency,
    double? price,
    int? measurementId,
  }) {
    return ProductModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      titleData: titleData ?? this.titleData,
      images: images ?? this.images,
      description: description ?? this.description,
      brand: brand ?? this.brand,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      price: price ?? this.price,
      measurementId: measurementId ?? this.measurementId,
    );
  }
}
