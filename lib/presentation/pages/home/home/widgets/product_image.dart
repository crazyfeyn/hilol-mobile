import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:flutter/material.dart';

Widget buildProductImage(ProductModel product) {
  //? Check if images exist and are not empty
  if (product.images.isNotEmpty) {
    final imageUrl = product.images.first;
    if (imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        height: 74,
        width: 80,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderImage();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const CircularProgressIndicator(strokeWidth: 2);
        },
      );
    }
  }

  return _buildPlaceholderImage();
}

Widget _buildPlaceholderImage() {
  return Container(
    height: 74,
    width: 80,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(Icons.shopping_bag_outlined, size: 32, color: Colors.grey[400]),
  );
}
