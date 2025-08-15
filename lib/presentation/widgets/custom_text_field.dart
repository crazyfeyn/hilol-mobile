import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final String? hintText;
  final TextEditingController ctr;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final Color? color;
  final bool obscureText;
  final String? suffixIcon;
  final VoidCallback? onSuffix;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.readOnly = false,
    this.hintText,
    required this.ctr,
    this.keyboardType = TextInputType.none,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.obscureText = false,
    this.color,
    this.minLines,
    this.maxLines = 1,
    this.suffixIcon,
    this.onSuffix,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctr,
      minLines: minLines,
      maxLines: maxLines,
      obscuringCharacter: "*",
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      style: AppStyles.bodyMDRegular,
      decoration: InputDecoration(
        fillColor: color,
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
