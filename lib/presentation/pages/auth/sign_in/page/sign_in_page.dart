import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/sign_in_model.dart';
import 'package:commerce_mobile/presentation/pages/auth/forget_pass/page/forget_pass_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_up/page/sign_up_page.dart';
import 'package:commerce_mobile/presentation/pages/auth/widget/check_widget.dart';
import 'package:commerce_mobile/presentation/pages/home/page/main_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_phone_field.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  static const String path = "/sign_in_page";

  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SignInBloc(), child: SignInView());
  }
}

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void deactivate() {
    context.read<SignInBloc>().add(SignInDispose());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.formzStatus.isSuccess && state.auth != null) {
          NavigationService.go(context, MainPage.path);
        } else if (state.formzStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr(LocaleKeys.login_error_message)),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<SignInBloc>();
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
                    context.tr(LocaleKeys.login_to_app),
                    style: AppStyles.titleXLSemibold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  CustomPhoneField(
                    readOnly: state.formzStatus.isInProgress,
                    controller: _phoneController,
                    title: context.tr(LocaleKeys.phone_number),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    readOnly: state.formzStatus.isInProgress,
                    title: context.tr(LocaleKeys.password_title_field),
                    hintText: context.tr(LocaleKeys.password_hint_field),
                    suffixIcon:
                        state.obscureText
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                    onSuffix: () => bloc.add(SignInChangeObscureText()),
                    obscureText: state.obscureText,
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
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed:
                          state.formzStatus.isInProgress
                              ? null
                              : () => NavigationService.push(
                                context,
                                ForgetPassPage.path,
                              ),
                      child: Text(context.tr(LocaleKeys.forget_password)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomElevatedButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        bloc.add(
                          SignInSendData(
                            SignInModel(
                              phoneNumber: _phoneController.text.trim(),
                              password: _passwordController.text.trim(),
                            ),
                          ),
                        );
                      }
                    },
                    isLoading: state.formzStatus.isInProgress,
                    title: context.tr(LocaleKeys.login_btn),
                  ),
                  const SizedBox(height: 24),
                  CheckWidget(
                    title: context.tr(LocaleKeys.create_account_btn),
                    subtitle: context.tr(LocaleKeys.do_not_have_account),
                    onTap:
                        () => NavigationService.push(context, SignUpPage.path),
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
