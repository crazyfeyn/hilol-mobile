import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/presentation/pages/home/details/page/details_page.dart';
import 'package:commerce_mobile/presentation/pages/home/widget/carusel_images.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppColors.white100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          final extra = { "product": product, "add": false };
          NavigationService.push(context, ProductDetailsPage.path, extra: extra);
        },
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageCarousel(urls: product.images ?? []),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(product.title ?? "", style: AppStyles.titleSMSemibold),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          product.price?.formatPrice(product.currency ?? "") ?? "",
                          style: AppStyles.titleXSSemibold.copyWith(
                            color: AppColors.primary700,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final extra = { "product": product, "add": true };
                          NavigationService.push(context, ProductDetailsPage.path, extra: extra);
                        },
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.primary600,
                          child: Icon(Icons.add, color: AppColors.white50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
