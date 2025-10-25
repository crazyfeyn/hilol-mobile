import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/presentation/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> urls;

  const ImageCarousel({super.key, required this.urls});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.urls.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: double.infinity,
                child: CustomNetworkImage(
                  fit: BoxFit.cover,
                  identity: widget.urls[index],
                ),
              );
            },
          ),

          if(widget.urls.isNotEmpty)
            Positioned(
            bottom: 4,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: widget.urls.length,
              effect: WormEffect(
                activeDotColor: AppColors.primary600,
                dotColor: AppColors.primary100,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}