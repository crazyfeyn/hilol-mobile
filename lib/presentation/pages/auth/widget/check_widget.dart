import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CheckWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() onTap;

  const CheckWidget(
      {Key? key,
        required this.title,
        required this.subtitle,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: subtitle,
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: ' $title',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primary500),
            recognizer: TapGestureRecognizer()
              ..onTap = onTap,
          )
        ],
      ),
    );
  }
}