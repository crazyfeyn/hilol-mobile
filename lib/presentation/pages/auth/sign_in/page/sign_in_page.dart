import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/auth/forget_pass/page/forget_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_up/page/sign_up_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/widget/check_widget.dart';
import 'package:commerce_mobile/presentation/pages/home/page/main_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  static String path = "/sign_in_page";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureText = true;

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
                context.tr(LocaleKeys.login_to_app),
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
              SizedBox(height: 12),
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
                  return null;
                },
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => NavigationService.push(context, ForgetPassPage.path),
                  child: Text(context.tr(LocaleKeys.forget_password)),
                ),
              ),
              SizedBox(height: 8),
              CustomElevatedButton(
                onTap: () {
                  if(_formKey.currentState!.validate()) {
                    NavigationService.go(context, MainPage.path);
                  }
                },
                title: context.tr(LocaleKeys.login_btn),
              ),
              SizedBox(height: 24),
              CheckWidget(
                title: context.tr(LocaleKeys.create_account_btn),
                subtitle: context.tr(LocaleKeys.do_not_have_account),
                onTap: () => NavigationService.push(context, SignUpPage.path),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
