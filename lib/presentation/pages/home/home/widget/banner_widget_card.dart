import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/presentation/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class BannerWidgetCard extends StatelessWidget {
  final bool isLoading;

  const BannerWidgetCard({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 10),
        enlargeCenterPage: true,
      ),
      items: List.generate(3, (index) {
        if (isLoading) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomShimmer(child: Container(color: AppColors.white100)),
          );
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl37Ha8cXj2c-sdAN1bfoPl31dXDgypc55Kw&s",
            placeholder: (context, url) {
              return CustomShimmer(child: Container(color: AppColors.white100));
            },
            errorWidget: (context, url, error) {
              return Container(color: AppColors.white100);
            },
          ),
        );
      }),
    );
  }
}
