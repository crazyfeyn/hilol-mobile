import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/auth/reset_pass/page/reset_pass_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_phone_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ForgetPassPage extends StatelessWidget {
  static const String path = "/forget_pass_page";

  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgetPassView();
  }
}

class ForgetPassView extends StatefulWidget {
  const ForgetPassView({super.key});

  @override
  State<ForgetPassView> createState() => _ForgetPassViewState();
}

class _ForgetPassViewState extends State<ForgetPassView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      final phone = _phoneController.text.trim();

      NavigationService.push(
        context,
        ResetPasswordPage.path,
        extra: {"phoneNumber": phone},
      );
    }
  }

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
              const SizedBox(height: 32),
              Text(
                context.tr(LocaleKeys.forget_password),
                style: AppStyles.titleXLSemibold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CustomPhoneField(
                controller: _phoneController,
                title: context.tr(LocaleKeys.phone_number),
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                onTap: _onContinue,
                title: context.tr(LocaleKeys.continue_btn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
