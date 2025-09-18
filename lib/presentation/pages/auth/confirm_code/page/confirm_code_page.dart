import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/confirm_code_model.dart';
import 'package:commerce_mobile/data/models/reset_pass_param_model.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/bloc/confirm_code_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/widget/pin_put_widget.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/widget/timer_widget.dart';
import 'package:commerce_mobile/presentation/pages/auth/forget_pass/bloc/reset_pass_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/reset_pass/page/reset_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/home/main/page/main_page.dart';
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
    // Check if this is reset password flow
    final isResetPasswordFlow =
        extra['phoneNumber'] != null && extra['password'] != null;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ConfirmCodeBloc()),
        if (isResetPasswordFlow)
          BlocProvider(create: (context) => ResetPassBloc()),
      ],
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

  //? Check if this is reset password flow
  bool get isResetPasswordFlow =>
      widget.extra['phoneNumber'] != null && widget.extra['password'] != null;

  @override
  void deactivate() {
    context.read<ConfirmCodeBloc>().add(ConfirmCodeDispose());
    if (isResetPasswordFlow) {
      context.read<ResetPassBloc>().add(const ResetPassEvent.dispose());
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    if (isResetPasswordFlow) {
      return _buildResetPasswordFlow(context);
    } else {
      return _buildNormalFlow(context);
    }
  }

  Widget _buildResetPasswordFlow(BuildContext context) {
    return BlocConsumer<ResetPassBloc, ResetPassState>(
      listener: (context, state) {
        if (state.formzStatus.isSuccess && state.resetPassToken != null) {
          // Password reset successful - navigate to sign in
          NavigationService.go(context, SignInPage.path);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.tr(LocaleKeys.password_reset_success),
              ), // Add this to your locale
              backgroundColor: Colors.green,
            ),
          );
        } else if (state.formzStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.tr(LocaleKeys.password_reset_error),
              ), // Add this to your locale
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return _buildScaffold(
          context,
          state.formzStatus,
          onSubmit: () => _handleResetPasswordSubmit(context),
        );
      },
    );
  }

  Widget _buildNormalFlow(BuildContext context) {
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
        return _buildScaffold(
          context,
          state.formzStatus,
          onSubmit: () => _handleNormalSubmit(context),
        );
      },
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    FormzSubmissionStatus formzStatus, {
    required VoidCallback onSubmit,
  }) {
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
            TimerWidget(
              email: "+${widget.extra["phone"] ?? widget.extra["phoneNumber"]}",
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              title:
                  isResetPasswordFlow
                      ? context.tr(
                        LocaleKeys.reset_password,
                      ) // Add this to your locale
                      : context.tr(LocaleKeys.continue_btn),
              isLoading: formzStatus.isInProgress,
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

                onSubmit();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleResetPasswordSubmit(BuildContext context) {
    final resetPassParam = ResetPassRepositoryParam(
      phone: widget.extra['phoneNumber']!,
      password: widget.extra['password']!,
      code: pinController.text.trim(),
    );

    context.read<ResetPassBloc>().add(ResetPassEvent.sendData(resetPassParam));
  }

  void _handleNormalSubmit(BuildContext context) {
    final confirmCodeModel = ConfirmCodeModel(
      code: pinController.text.trim(),
      clientId: widget.extra["clientId"] ?? "",
    );

    context.read<ConfirmCodeBloc>().add(ConfirmCodeSendData(confirmCodeModel));
  }
}
