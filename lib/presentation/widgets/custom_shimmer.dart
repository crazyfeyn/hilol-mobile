import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;

  const CustomShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white100,
      highlightColor: AppColors.white200,
      period: const Duration(seconds: 2),
      child: child,
    );
  }
}
