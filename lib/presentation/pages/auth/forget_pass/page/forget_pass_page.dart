import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/page/confirm_code_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/reset_pass/page/reset_pass_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPassPage extends StatefulWidget {
  static const String path = "/forget_pass_page";

  const ForgetPassPage({super.key});

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
                context.tr(LocaleKeys.forget_password),
                style: AppStyles.titleXLSemibold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              CustomTextField(
                title: context.tr(LocaleKeys.email),
                hintText: context.tr(LocaleKeys.email_hint),
                keyboardType: TextInputType.emailAddress,
                ctr: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(LocaleKeys.empty_filed);
                  } else if (!RegExp(
                    r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$",
                  ).hasMatch(value)) {
                    return context.tr(LocaleKeys.email_invalid_format);
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              CustomElevatedButton(
                onTap: () {
                  if(_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();

                    final email = _emailController.text.trim();
                    final extra = {"page": ResetPasswordPage.path, "email": email};
                    NavigationService.push(context, ConfirmCodePage.path, extra: extra);
                  }
                },
                title: context.tr(LocaleKeys.login_btn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
