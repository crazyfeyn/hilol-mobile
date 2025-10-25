import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/product_category_model.dart';
import 'package:commerce_mobile/presentation/widgets/custom_network_image.dart';
import 'package:commerce_mobile/presentation/widgets/custom_shimmer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategorySectionCard extends StatelessWidget {
  final bool isLoading;
  final List<ProductCategoryModel> categories;

  final int? value;
  final Function(int?)? onChanged;

  const CategorySectionCard({
    super.key,
    this.value,
    this.onChanged,
    this.isLoading = false,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 64,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CustomShimmer(
                      child: Container(
                        width: 48,
                        height: 48,
                        color: AppColors.white100,
                      ),
                    ),
                  ),
                  CustomShimmer(
                    child: Container(
                      width: 56,
                      height: 10,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 4),
        ),
      );
    }
    return SizedBox(
      height: 72,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        itemBuilder: (context, index) {
          if(index == 0) {
            return GestureDetector(
              onTap: () {
                if(value == null) return;
                onChanged?.call(null);
              },
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(maxWidth: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.white100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.grid_view),
                    ),
                    Spacer(),
                    Text(
                      context.tr(LocaleKeys.all),
                      style: AppStyles.labelMDRegular,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Container(height: 2, color: value == null ? AppColors.primary600 : null),
                  ],
                ),
              ),
            );
          }

          final category = categories[index - 1];
          final isSelect = category.id == value;
          return GestureDetector(
            onTap: () {
              if(isSelect) return;
              onChanged?.call(category.id);
            },
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CustomNetworkImage(
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      identity: "",
                    ),
                  ),
                  Spacer(),
                  Text(
                    category.title ?? "",
                    style: AppStyles.labelMDRegular,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Container(height: 2, color: isSelect ? AppColors.primary600 : null),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 4),
      ),
    );
  }
}
