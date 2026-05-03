import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/extension/extensions.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/presentation/pages/home/details/page/details_page.dart';
import 'package:commerce_mobile/presentation/pages/home/widget/carusel_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Check if product has stock information
    final hasStock = (product.amount ?? 0) > 0;
    final stockCount = product.amount ?? 0;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppColors.white100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap:
            hasStock
                ? () {
                  final extra = {"product": product, "add": false};
                  NavigationService.push(
                    context,
                    ProductDetailsPage.path,
                    extra: extra,
                  );
                }
                : null,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ImageCarousel(urls: product.images ?? []),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    product.title ?? "",
                    style: AppStyles.titleSMSemibold.copyWith(
                      color: hasStock ? null : AppColors.black300,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Stock quantity indicator
                  Row(
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 14,
                        color:
                            hasStock ? AppColors.success : AppColors.error600,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        hasStock
                            ? tr(
                              LocaleKeys.in_stock,
                              namedArgs: {'count': '$stockCount'},
                            )
                            : tr(LocaleKeys.unavailable),
                        style: AppStyles.labelMDRegular.copyWith(
                          color:
                              hasStock ? AppColors.success : AppColors.error600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          product.price?.formatPrice(product.currency ?? "") ??
                              "",
                          style: AppStyles.titleXSSemibold.copyWith(
                            color:
                                hasStock
                                    ? AppColors.primary700
                                    : AppColors.black300,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: hasStock ? 1.0 : 0.5,
                        child: GestureDetector(
                          onTap:
                              hasStock
                                  ? () {
                                    final extra = {
                                      "product": product,
                                      "add": true,
                                    };
                                    NavigationService.push(
                                      context,
                                      ProductDetailsPage.path,
                                      extra: extra,
                                    );
                                  }
                                  : null,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color:
                                  hasStock
                                      ? AppColors.primary600
                                      : AppColors.black200,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white50,
                              size: 18,
                            ),
                          ),
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
