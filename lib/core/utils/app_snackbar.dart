import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GlobalSnackBar {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showError(String message, {String? title}) {
    title = title ?? "";
    scaffoldMessengerKey.currentState?.showSnackBar(
      _buildCustomSnackBar(AppColors.red500, title, message),
    );
  }

  static void showWarning(String title, String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      _buildCustomSnackBar(AppColors.warning400, title, message),
    );
  }

  static void showSuccess(String message, {String? title}) {
    title = title ?? "";
    scaffoldMessengerKey.currentState?.showSnackBar(
      _buildCustomSnackBar(AppColors.success, title, message),
    );
  }

  static SnackBar _buildCustomSnackBar(
    Color color,
    String title,
    String description,
  ) {
    return SnackBar(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.bodyMDSemibold.copyWith(
              color: AppColors.black950,
            ),
          ),
          Text(
            description,
            style: AppStyles.bodySMRegular.copyWith(
              color: AppColors.black500,
            ),
          ),
        ],
      ),
      elevation: 2,
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      animation: AlwaysStoppedAnimation(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}
