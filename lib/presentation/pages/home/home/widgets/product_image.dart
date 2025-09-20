import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:flutter/material.dart';

Widget buildProductImage(ProductModel product) {
  //? Check if images exist and are not empty
  if (product.images.isNotEmpty) {
    final imageUrl = product.images.first;
    if (imageUrl.isNotEmpty) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            height: 74,
            width: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return _buildPlaceholderContent();
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return _buildLoadingContent();
            },
          ),
        ),
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
    child: _buildPlaceholderContent(),
  );
}

Widget _buildPlaceholderContent() {
  return Icon(Icons.shopping_bag_outlined, size: 32, color: Colors.grey[400]);
}

Widget _buildLoadingContent() {
  return const Center(child: CircularProgressIndicator(strokeWidth: 2));
}
