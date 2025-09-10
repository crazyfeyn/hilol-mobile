import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool forceErrorState;

  const PinPutWidget({
    super.key,
    required this.controller,
    this.forceErrorState = false,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: AppStyles.bodyMDRegular,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.black100),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.black50,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyBorderWith(
      border: Border.all(width: 2, color: AppColors.black100),
    );

    final submittedPinTheme = defaultPinTheme.copyBorderWith(
      border: Border.all(width: 2, color: AppColors.black100),
    );

    final errorPinTheme = defaultPinTheme.copyBorderWith(
      border: Border.all(width: 2, color: AppColors.red300),
    );

    return Pinput(
      length: 6,
      controller: controller,
      forceErrorState: forceErrorState,
      preFilledWidget: Text(
        '-',
        style: AppStyles.bodyMDRegular.copyWith(color: AppColors.textSecondary),
      ),
      separatorBuilder: (index) => const SizedBox(width: 8),
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      submittedPinTheme: submittedPinTheme,
      focusedPinTheme: focusedPinTheme,
      defaultPinTheme: defaultPinTheme,
      errorPinTheme: errorPinTheme,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
