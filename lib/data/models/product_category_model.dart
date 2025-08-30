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
}
