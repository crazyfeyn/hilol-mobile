import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/confirm_code_model.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/bloc/confirm_code_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/widget/pin_put_widget.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/widget/timer_widget.dart';
import 'package:commerce_mobile/presentation/pages/auth/reset_pass/page/reset_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/home/page/main_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmCodePage extends StatelessWidget {
  static const String path = '/confirm_code_page';

  final Map<String, dynamic> extra;

  const ConfirmCodePage({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmCodeBloc(),
      child: ConfirmCodeView(extra: extra),
    );
  }
}

class ConfirmCodeView extends StatefulWidget {
  final Map<String, dynamic> extra;

  const ConfirmCodeView({super.key, required this.extra});

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}

class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  final pinController = TextEditingController();

  @override
  void deactivate() {
    context.read<ConfirmCodeBloc>().add(ConfirmCodeDispose());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmCodeBloc, ConfirmCodeState>(
      listener: (context, state) {
        if (state.formzStatus.isSuccess && state.auth != null) {
          // If coming from reset password flow, navigate to reset password page
          if (widget.extra["page"] == ResetPasswordPage.path) {
            NavigationService.push(context, ResetPasswordPage.path);
          } else {
            // For sign up flow, navigate to main page
            NavigationService.go(context, MainPage.path);
          }
        } else if (state.formzStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr(LocaleKeys.verify_code_error_message)),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<ConfirmCodeBloc>();
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Text(
                  context.tr(LocaleKeys.verification_code),
                  style: AppStyles.titleXLSemibold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                PinPutWidget(controller: pinController),
                const SizedBox(height: 16),
                TimerWidget(email: "+${widget.extra["phone"]}"),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  title: context.tr(LocaleKeys.continue_btn),
                  isLoading: state.formzStatus.isInProgress,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();

                    if (pinController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            context.tr(LocaleKeys.enter_verification_code),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    // Create confirm code model with necessary data
                    final confirmCodeModel = ConfirmCodeModel(
                      code: pinController.text.trim(),
                      clientId: widget.extra["clientId"] ?? "",
                      // Add other required fields based on your ConfirmCodeModel
                    );

                    bloc.add(ConfirmCodeSendData(confirmCodeModel));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
