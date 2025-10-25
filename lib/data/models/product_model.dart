// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

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
      );

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    categoryId: json["categoryId"],
    title: json["title"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    description: json["description"],
    brand: json["brand"],
    amount: json["amount"],
    currency: json["currency"],
    price: double.tryParse(json["price"]?.toString() ?? ""),
    measurementId: json["measurementId"],
  );

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
  };
}
