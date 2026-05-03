import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/sign_up_model.dart';
import 'package:commerce_mobile/presentation/pages/auth/confirm_code/page/confirm_code_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/widget/check_widget.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_phone_field.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  static const String path = "/sign_up_page";
  final String? redirectPath;
  final bool fromCheckout;

  const SignUpPage({
    super.key,
    this.redirectPath,
    this.fromCheckout = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: SignUpView(
        redirectPath: redirectPath,
        fromCheckout: fromCheckout,
      ),
    );
  }
}

class SignUpView extends StatefulWidget {
  final String? redirectPath;
  final bool fromCheckout;

  const SignUpView({
    super.key,
    this.redirectPath,
    this.fromCheckout = false,
  });

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void deactivate() {
    context.read<SignUpBloc>().add(SignUpDispose());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.formzStatus.isSuccess && state.clientId != null) {
          final extra = {
            "clientId": state.clientId,
            "auth": state.auth,
            "redirectPath": widget.redirectPath,
            "fromCheckout": widget.fromCheckout,
          };
          NavigationService.push(context, ConfirmCodePage.path, extra: extra);
        }
      },
      builder: (context, state) {
        final bloc = context.read<SignUpBloc>();
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
                    context.tr(LocaleKeys.create_new_account),
                    style: AppStyles.titleXLSemibold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  CustomTextField(
                    readOnly: state.formzStatus.isInProgress,
                    title: context.tr(LocaleKeys.first_name_title_field),
                    hintText: context.tr(LocaleKeys.first_name_hint_field),
                    ctr: _firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr(
                          LocaleKeys.first_name_error_field_empty,
                        );
                      }

                      if (value.length < 3) {
                        return context.tr(
                          LocaleKeys.first_name_error_field_too_short,
                        );
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  CustomTextField(
                    readOnly: state.formzStatus.isInProgress,
                    title: context.tr(LocaleKeys.last_name_title_field),
                    hintText: context.tr(LocaleKeys.last_name_hint_field),
                    ctr: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr(
                          LocaleKeys.last_name_error_field_empty,
                        );
                      }

                      if (value.length < 3) {
                        return context.tr(
                          LocaleKeys.last_name_error_field_too_short,
                        );
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  CustomPhoneField(
                    readOnly: state.formzStatus.isInProgress,
                    title: context.tr(LocaleKeys.phone_number),
                    controller: _phoneController,
                  ),
                  SizedBox(height: 12),
                  CustomTextField(
                    readOnly: state.formzStatus.isInProgress,
                    title: context.tr(LocaleKeys.password_title_field),
                    hintText: context.tr(LocaleKeys.password_hint_field),
                    suffixIcon:
                        state.obscureText1
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                    onSuffix: () => bloc.add(SignUpChangeObscureText1()),
                    obscureText: state.obscureText1,
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
                        return context.tr(
                          LocaleKeys.password_error_field_no_number,
                        );
                      }

                      if (!RegExp(r'[!@#$&*~]').hasMatch(value)) {
                        return context.tr(
                          LocaleKeys.password_error_field_no_special_char,
                        );
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  CustomTextField(
                    readOnly: state.formzStatus.isInProgress,
                    title: context.tr(LocaleKeys.confirm_password_title_field),
                    hintText: context.tr(
                      LocaleKeys.confirm_password_hint_field,
                    ),
                    suffixIcon:
                        state.obscureText2
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                    onSuffix: () => bloc.add(SignUpChangeObscureText2()),
                    obscureText: state.obscureText2,
                    ctr: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr(
                          LocaleKeys.confirm_password_error_field_empty,
                        );
                      }

                      if (!_passwordController.text.trim().contains(value)) {
                        return context.tr(
                          LocaleKeys
                              .confirm_password_error_field_password_mismatch,
                        );
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  CustomElevatedButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        bloc.add(
                          SignUpSendData(
                            SignUpModel(
                              firstname: _firstNameController.text.trim(),
                              lastname: _lastNameController.text.trim(),
                              phoneNumber: _phoneController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          ),
                        );
                      }
                    },
                    isLoading: state.formzStatus.isInProgress,
                    title: context.tr(LocaleKeys.create_account_btn),
                  ),
                  SizedBox(height: 24),
                  CheckWidget(
                    title: context.tr(LocaleKeys.login_btn),
                    subtitle: context.tr(LocaleKeys.have_account),
                    onTap: () => NavigationService.pop(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
