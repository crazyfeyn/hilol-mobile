import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/widget/pin_put_widget.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/widget/timer_widget.dart';
import 'package:commerce_mobile/presentation/pages/auth/reset_pass/page/reset_pass_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmCodePage extends StatefulWidget {
  static const String path = '/confirm_code_page';

  final Map<String, dynamic> extra;

  const ConfirmCodePage({super.key, required this.extra});

  @override
  State<ConfirmCodePage> createState() => _ConfirmCodePageState();
}

class _ConfirmCodePageState extends State<ConfirmCodePage> {
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 32),
            Text(
              context.tr(LocaleKeys.verification_code),
              style: AppStyles.titleXLSemibold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            PinPutWidget(controller: pinController),
            SizedBox(height: 16),
            TimerWidget(email: widget.extra["email"]),
            SizedBox(height: 16),
            CustomElevatedButton(
              title: context.tr(LocaleKeys.continue_btn),
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if(widget.extra["page"] == ResetPasswordPage.path) {
                  NavigationService.push(context, widget.extra["page"]);
                } else {
                  NavigationService.go(context, widget.extra["page"]);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
