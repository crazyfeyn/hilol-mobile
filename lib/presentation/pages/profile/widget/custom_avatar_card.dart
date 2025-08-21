import 'package:cached_network_image/cached_network_image.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CustomAvatarCard extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  final double size;
  final bool isLoading;
  final Color color;
  final Function(String)? onChange;

  const CustomAvatarCard({
    super.key,
    required this.imageUrl,
    this.height = 80,
    this.width = 80,
    this.size = 24,
    this.isLoading = false,
    this.color = AppColors.black100,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height),
        border: Border.all(width: 3, color: AppColors.white50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            offset: Offset(0, 2),
            spreadRadius: -2,
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: Offset(0, 4),
            spreadRadius: -2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Builder(
        builder: (_) {
          if (isLoading) {
            return Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(height),
              ),
              child: CupertinoActivityIndicator(),
            );
          }

          return GestureDetector(
            onTap: onChange != null ? () async {
              final ImagePicker picker = ImagePicker();
              final xFile = await picker.pickImage(source: ImageSource.gallery);
              if(xFile != null) {
                final croppedFile = await ImageCropper().cropImage(
                    sourcePath: xFile.path,
                    uiSettings: [
                      AndroidUiSettings(lockAspectRatio: true, initAspectRatio: CropAspectRatioPreset.square, aspectRatioPresets: [CropAspectRatioPreset.square]),
                      IOSUiSettings(aspectRatioPresets: [CropAspectRatioPreset.square]),
                    ]
                );
                if(croppedFile == null) return;
                onChange?.call(croppedFile.path);
              }
            } : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(height),
              child: imageUrl != null ? CachedNetworkImage(
                imageUrl: imageUrl ?? '',
                height: height,
                width: width,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: height,
                    width: width,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(height),
                      image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
                    ),
                    child: onChange != null ? editWidget() : null,
                  );
                },
                placeholder: placeholder,
                errorWidget: errorWidget,
              ) : errorWidget(context, '', null),
            ),
          );
        },
      ),
    );
  }

  Widget placeholder(context, url) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(height),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(strokeWidth: 2),
          if (onChange != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: editWidget(),
            ),
        ],
      ),
    );
  }

  Widget errorWidget(context, url, error) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(height),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(CupertinoIcons.camera, size: size, color: Colors.white),
          if (onChange != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: editWidget(),
            ),
        ],
      ),
    );
  }

  Widget editWidget() {
    return Container(
      height: height / 2,
      color: AppColors.black950.withValues(alpha: 0.3),
      alignment: Alignment.center,
      child: Icon(CupertinoIcons.camera, size: size, color: Colors.white),
    );
  }
}
