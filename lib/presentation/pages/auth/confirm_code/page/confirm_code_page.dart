import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/services/session_service.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/models/confirm_code_model.dart';
import 'package:commerce_mobile/data/models/reset_pass_param_model.dart';
import 'package:commerce_mobile/data/repositories/user_repository_impl.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/bloc/confirm_code_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/widget/pin_put_widget.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/widget/timer_widget.dart';
import 'package:commerce_mobile/presentation/pages/auth/forget_pass/bloc/reset_pass_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/reset_pass/page/reset_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/home/home/page/home_page.dart';
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
  final _userRepository = UserRepositoryImpl();

  //? Check if this is reset password flow
  bool get isResetPasswordFlow => widget.extra['phoneNumber'] != null && widget.extra['password'] != null;

  @override
  void deactivate() {
    context.read<ConfirmCodeBloc>().add(ConfirmCodeDispose());
    if (isResetPasswordFlow) {
      context.read<ResetPassBloc>().add(const ResetPassEvent.dispose());
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _userRepository.dispose();
    super.dispose();
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
          GlobalSnackBar.showSuccess(context.tr(LocaleKeys.password_reset_success));
        } else if (state.formzStatus.isFailure) {
          GlobalSnackBar.showError(context.tr(LocaleKeys.password_reset_error));
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
          () async {
            // Persist tokens BEFORE navigating to pages that fetch protected APIs.
            await DBService.setAccessToken(state.auth!.accessToken);
            await DBService.setRefreshToken(state.auth!.refreshToken);
            if ((widget.extra["clientId"] as String?)?.isNotEmpty == true) {
              await DBService.setClientId(widget.extra["clientId"] as String);
            }
            final userResult = await _userRepository.fetchUserData();
            if (userResult.isLeft()) {
              await DBService.logOut();
              if (!context.mounted) return;
              GlobalSnackBar.showError(
                context.tr(LocaleKeys.unexpected_error),
              );
              return;
            }
            SessionService.setAuthenticated(true);
            if (widget.extra["fromCheckout"] == true) {
              await SessionService.applyPendingCheckoutAfterLogin();
            }
            if (!context.mounted) return;

            // If coming from reset password flow, navigate to reset password page
            if (widget.extra["page"] == ResetPasswordPage.path) {
              NavigationService.push(context, ResetPasswordPage.path);
            } else {
              // For sign up flow, navigate to main page
              final redirectPath = widget.extra["redirectPath"] as String?;
              NavigationService.go(context, redirectPath ?? HomePage.path);
            }
          }();
        } else if (state.formzStatus.isFailure) {
          GlobalSnackBar.showError(context.tr(LocaleKeys.verify_code_error_message));
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
                  GlobalSnackBar.showError(context.tr(LocaleKeys.enter_verification_code));
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
