import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  static const String path = '/reset_pass_page';

  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool obscureText = true;
  bool obscureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 32),
              Text(
                context.tr(LocaleKeys.create_new_password),
                style: AppStyles.titleXLSemibold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              CustomTextField(
                title: context.tr(LocaleKeys.password_title_field),
                hintText: context.tr(LocaleKeys.password_hint_field),
                suffixIcon: obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                onSuffix: () => setState(() => obscureText = !obscureText),
                obscureText: obscureText,
                ctr: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(
                      LocaleKeys.password_error_field_empty,
                    );
                  }

                  if (value.length < 8) {
                    return context.tr(
                      LocaleKeys.password_error_field_too_short,
                    );
                  }

                  if (value.contains(' ')) {
                    return context.tr(
                      LocaleKeys.password_error_field_contains_space,
                    );
                  }

                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return context.tr(
                      LocaleKeys.password_error_field_no_lowercase,
                    );
                  }

                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return context.tr(
                      LocaleKeys.password_error_field_no_uppercase,
                    );
                  }

                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return context.tr(LocaleKeys.password_error_field_no_number);
                  }

                  if (!RegExp(r'[!@#$&*~]').hasMatch(value)) {
                    return context.tr(LocaleKeys.password_error_field_no_special_char);
                  }

                  return null;
                },
              ),
              SizedBox(height: 12),
              CustomTextField(
                title: context.tr(LocaleKeys.confirm_password_title_field),
                hintText: context.tr(LocaleKeys.confirm_password_hint_field),
                suffixIcon: obscureTextConfirm ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                onSuffix: () => setState(() => obscureTextConfirm = !obscureTextConfirm),
                obscureText: obscureTextConfirm,
                ctr: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(
                      LocaleKeys.confirm_password_error_field_empty,
                    );
                  }

                  if(!_passwordController.text.trim().contains(value)) {
                    return context.tr(
                      LocaleKeys.confirm_password_error_field_password_mismatch,
                    );
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              CustomElevatedButton(
                onTap: () {
                  if(_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    NavigationService.go(context, SignInPage.path);
                  }
                },
                title: context.tr(LocaleKeys.continue_btn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
