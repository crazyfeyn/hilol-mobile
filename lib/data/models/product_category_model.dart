import 'dart:ui';
import 'package:flutter/material.dart';

class ProductCategoryModel {
  final int id;
  final String name;
  final IconData icon;
  final Color color;

  ProductCategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: IconData(
        json['iconCode'] as int, // you need to store icon codePoint in JSON
        fontFamily: json['iconFontFamily'] ?? 'MaterialIcons',
      ),
      color: Color(json['color'] as int), // store Color as ARGB int
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'iconCode': icon.codePoint,
    'iconFontFamily': icon.fontFamily,
    'color': color.value,
  };
}

class Product {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final Color backgroundColor;
  final int categoryId;
  bool isFavorite;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.backgroundColor,
    required this.categoryId,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      backgroundColor: Color(json['backgroundColor'] as int),
      categoryId: json['categoryId'] as int,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'price': price,
    'imagePath': imagePath,
    'backgroundColor': backgroundColor.value,
    'categoryId': categoryId,
    'isFavorite': isFavorite,
  };
}
