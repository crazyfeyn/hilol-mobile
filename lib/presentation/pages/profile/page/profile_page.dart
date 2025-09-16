import 'dart:io';

import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/services/launcher_service.dart';
import 'package:commerce_mobile/core/services/share_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/auth/sign_in/page/sign_in_page.dart';
import 'package:commerce_mobile/presentation/pages/history/pages/order_history_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/bloc/user_bloc.dart';
import 'package:commerce_mobile/presentation/pages/profile/page/edit_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/custom_avatar_card.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/profile_card.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/profile_logout_and_delete.dart';
import 'package:commerce_mobile/presentation/widgets/language_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(const UserEvent.fetchData()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void deactivate() {
    context.read<UserBloc>().add(const UserEvent.dispose());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        // Handle logout success
        if (state.formzStatus.isSuccess && state.user == null) {
          NavigationService.go(context, SignInPage.path);
        }
        // Handle logout/fetch failure
        else if (state.formzStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr("LocaleKeys.error_occurred")),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<UserBloc>();

        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
              top: MediaQuery.viewPaddingOf(context).top + 32,
            ),
            child: Center(
              child: Column(
                children: [
                  // Show loading indicator while fetching user data
                  if (state.formzStatus.isInProgress && state.user == null)
                    const CircularProgressIndicator()
                  else ...[
                    CustomAvatarCard(
                      imageUrl:
                          state.user?.imageUrl ??
                          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${state.user?.firstname ?? 'Mark'} ${state.user?.lastname ?? 'Adam'}",
                      style: AppStyles.titleXLSemibold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      state.user?.phone ?? "Phone number is not found",
                      style: AppStyles.labelLGSemibold.copyWith(
                        color: AppColors.black400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],

                  const SizedBox(height: 24),
                  ProfileCard(
                    icon: CupertinoIcons.bag,
                    title: context.tr(LocaleKeys.my_orders),
                    onTap:
                        state.formzStatus.isInProgress
                            ? null
                            : () => NavigationService.push(
                              context,
                              OrderHistoryPage.path,
                            ),
                  ),

                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        state.formzStatus.isInProgress
                            ? null
                            : () => LanguageBottomSheet.showBottomSheet(
                              context: context,
                            ),
                    flag: LangService.langIcon(context.locale.languageCode),
                    icon: CupertinoIcons.globe,
                    title: context.tr(LocaleKeys.change_language),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        state.formzStatus.isInProgress
                            ? null
                            : () => LauncherService.launcherApplication(
                              AppConstants.support,
                            ),
                    icon: CupertinoIcons.bubble_left_bubble_right,
                    title: context.tr(LocaleKeys.support),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        state.formzStatus.isInProgress
                            ? null
                            : () {
                              if (Platform.isIOS) {
                                ShareService.shareUri(
                                  context,
                                  AppConstants.appStore,
                                );
                              } else {
                                ShareService.shareUri(
                                  context,
                                  AppConstants.playStore,
                                );
                              }
                            },
                    icon: CupertinoIcons.share,
                    title: context.tr(LocaleKeys.share_app),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        state.formzStatus.isInProgress
                            ? null
                            : () => LauncherService.launcherApplication(
                              AppConstants.privacyPolice,
                            ),
                    icon: CupertinoIcons.exclamationmark_shield,
                    title: context.tr(LocaleKeys.privacy_police),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        state.formzStatus.isInProgress
                            ? null
                            : () => LauncherService.launcherApplication(
                              AppConstants.termsOfServices,
                            ),
                    icon: CupertinoIcons.info,
                    title: context.tr(LocaleKeys.terms_of_services),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        state.formzStatus.isInProgress
                            ? null
                            : () {
                              ProfileLogoutAndDelete.showDialog(
                                context,
                                isDelete: false,
                                onTap: () {
                                  // Navigator.pop(context);
                                  bloc.add(const UserEvent.logout());
                                },
                              );
                            },
                    icon: CupertinoIcons.square_arrow_right,
                    title: context.tr(LocaleKeys.logout_account),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        state.formzStatus.isInProgress
                            ? null
                            : () {
                              ProfileLogoutAndDelete.showDialog(
                                context,
                                isDelete: true,
                                onTap: () {
                                  bloc.add(const UserEvent.logout());
                                  NavigationService.go(
                                    context,
                                    SignInPage.path,
                                  );
                                },
                              );
                            },
                    isLogout: true,
                    icon: CupertinoIcons.delete,
                    title: context.tr(LocaleKeys.delete_account),
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
