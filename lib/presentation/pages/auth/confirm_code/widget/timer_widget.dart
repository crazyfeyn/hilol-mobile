import 'dart:async';

import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final String email;

  const TimerWidget({super.key, required this.email});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer timer;
  late int seconds;

  void startTimer() {
    seconds = AppConstants.confirmCodeSeconds;
    timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (seconds > 0) {
        setState(() => seconds--);
      } else {
        time.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final minute = (seconds ~/ 60).toString().padLeft(2, '0');
    final second = (seconds % 60).toString().padLeft(2, '0');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          plural(LocaleKeys.set_email, 1, args: [widget.email]),
          style: AppStyles.bodyMDRegular.copyWith(color: AppColors.black300),
        ),
        GestureDetector(
          onTap: seconds == 0 ? () => setState(() => seconds = AppConstants.confirmCodeSeconds) : null,
          child: Text(
            seconds == 0 ? context.tr(LocaleKeys.reset_code) : '$minute:$second',
            style: AppStyles.bodyMDSemibold.copyWith(
              color: AppColors.primary500,
            ),
          ),
        ),
      ],
    );
  }
}
