import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/presentation/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final bool isLang;
  final bool isFirst;
  final bool isLast;
  final bool isLogout;
  final IconData icon;
  final String? flag;
  final String title;
  final String? prompt;
  final VoidCallback? onTap;

  const ProfileCard({
    super.key,
    this.isLang = false,
    this.isFirst = false,
    this.isLast = false,
    this.isLogout = false,
    required this.icon,
    required this.title,
    this.flag,
    this.prompt,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.vertical(
        top: isFirst ? Radius.circular(16) : Radius.zero,
        bottom: isLast ? Radius.circular(16) : Radius.zero,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.nF8F7F7,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          spacing: 8,
          children: [
            if (flag != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: CustomSvg(icon: flag!, size: 24),
              )
            else
              Icon(
                icon,
                color: isLogout ? AppColors.red500 : AppColors.black950,
                size: 22,
              ),
            Expanded(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                text: TextSpan(
                  text: title,
                  style: AppStyles.bodyMDRegular.copyWith(
                    color: isLogout ? AppColors.red500 : AppColors.black950,
                  ),
                  children: [
                    if (prompt != null)
                      TextSpan(
                        text: " $prompt",
                        style: AppStyles.bodyMDSemibold.copyWith(
                          color: AppColors.primary500,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Icon(Icons.navigate_next, size: 24, color: AppColors.black500),
          ],
        ),
      ),
    );
  }
}
