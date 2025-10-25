// To parse this JSON data, do
//
//     final productCategoryModel = productCategoryModelFromMap(jsonString);

import 'dart:convert';

ProductCategoryModel productCategoryModelFromMap(String str) => ProductCategoryModel.fromMap(json.decode(str));

String productCategoryModelToMap(ProductCategoryModel data) => json.encode(data.toMap());

class ProductCategoryModel {
  final int? id;
  final String? title;
  final String? description;

  ProductCategoryModel({
    this.id,
    this.title,
    this.description,
  });

  ProductCategoryModel copyWith({
    int? id,
    String? title,
    String? description,
  }) =>
      ProductCategoryModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  factory ProductCategoryModel.fromMap(Map<String, dynamic> json) => ProductCategoryModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
  };
}
