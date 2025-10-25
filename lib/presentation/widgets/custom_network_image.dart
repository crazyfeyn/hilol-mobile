import 'package:cached_network_image/cached_network_image.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/presentation/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? identity;

  const CustomNetworkImage({
    super.key,
    required this.identity,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: "${NetworkService.getService}${NetworkService.apiFileDownload}?identity=$identity",
      placeholder: (context, url) {
        return CustomShimmer(child: Container(color: AppColors.white100));
      },
      errorWidget: (context, url, error) {
        return Container(
          color: AppColors.white100,
          child: Icon(Icons.image, color: AppColors.white300, size: 32),
        );
      },
    );
  }
}
