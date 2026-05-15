import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:flutter/material.dart';

class BarcodeResultWidget extends StatelessWidget {
  final ProductModel product;

  const BarcodeResultWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.images != null && product.images!.isNotEmpty)
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: product.images!.length,
                itemBuilder:
                    (_, i) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product.images![i],
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) => const Center(
                              child: Icon(Icons.broken_image, size: 48),
                            ),
                      ),
                    ),
              ),
            ),
          const SizedBox(height: 16),
          Text(
            product.localizedTitle ?? product.title ?? 'Unknown Product',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (product.brand != null) ...[
            const SizedBox(height: 4),
            Text(
              product.brand!,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
          ],
          const SizedBox(height: 12),
          if (product.price != null)
            Row(
              children: [
                Text(
                  '${product.price!.toStringAsFixed(2)} ${product.currency ?? ''}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (product.amount != null) ...[
                  const SizedBox(width: 12),
                  Text(
                    'Qty: ${product.amount}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          if (product.localizedDescription != null) ...[
            const SizedBox(height: 12),
            Text(
              product.localizedDescription!,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}
