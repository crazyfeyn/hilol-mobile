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
import 'package:commerce_mobile/presentation/pages/my_order/page/my_order_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/custom_avatar_card.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/profile_card.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/profile_logout_and_delete.dart';
import 'package:commerce_mobile/presentation/widgets/language_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  static const String path = "/profile_page";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  WidgetsBinding get _binding => WidgetsBinding.instance;

  void _initState(_) {
    context.read<ProfileBloc>().add(ProfileFetchData());
  }

  @override
  void initState() {
    _binding.addPostFrameCallback(_initState);
    super.initState();
  }

  @override
  void deactivate() {
    context.read<ProfileBloc>().add(ProfileDispose());
    super.deactivate();
  }

  void _showBusinessInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Business Information', style: AppStyles.titleLGSemibold),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildInfoRow('Business Name', '주식회사 하나피 (Hanafi Co., Ltd.)'),
                const SizedBox(height: 8),
                _buildInfoRow('Business Registration Number', '1388605788'),
                const SizedBox(height: 8),
                _buildInfoRow(
                  'Representative Name',
                  'SHARIPOV AZIZBEK HAKIMJON UGLI',
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  'Business Address',
                  '서울특별시 동대문구 경희대로 26 (회기동) 202호',
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  'Customer Service',
                  'Email: golibtoramurodov@gmail.com / Tel: 010-8029-1802',
                ),
                const SizedBox(height: 8),
                _buildInfoRow('E-commerce Registration', '2025-서울동대문-2078'),
                const SizedBox(height: 8),
                _buildInfoRow('Refund Inquiries', '+82-010-6343-1995'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close',
                style: AppStyles.bodyMDSemibold.copyWith(
                  color: AppColors.primary500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showRefundPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Refund & Exchange Policy',
            style: AppStyles.titleLGSemibold,
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Refund Policy',
                  style: AppStyles.labelLGSemibold.copyWith(
                    color: AppColors.black950,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Refunds are available within 7 days of purchase if the product is unused and in original condition.',
                  style: AppStyles.bodySMRegular.copyWith(
                    color: AppColors.black600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Refund Inquiries',
                  style: AppStyles.labelLGSemibold.copyWith(
                    color: AppColors.black950,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'For refund inquiries, please contact: +82-010-6343-1995',
                  style: AppStyles.bodySMRegular.copyWith(
                    color: AppColors.black600,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close',
                style: AppStyles.bodyMDSemibold.copyWith(
                  color: AppColors.primary500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeliveryPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delivery Policy', style: AppStyles.titleLGSemibold),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Delivery Information',
                  style: AppStyles.labelLGSemibold.copyWith(
                    color: AppColors.black950,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Orders are shipped within 3–5 business days. Tracking information will be provided by email or SMS.',
                  style: AppStyles.bodySMRegular.copyWith(
                    color: AppColors.black600,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close',
                style: AppStyles.bodyMDSemibold.copyWith(
                  color: AppColors.primary500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: AppStyles.labelLGMedium.copyWith(color: AppColors.black600),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: AppStyles.bodySMRegular.copyWith(color: AppColors.black950),
          ),
        ),
      ],
    );
  }

  Widget _buildPolicySection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.labelLGSemibold.copyWith(color: AppColors.black950),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: AppStyles.bodySMRegular.copyWith(color: AppColors.black600),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.logoutStatus.isSuccess || state.deleteStatus.isSuccess) {
          NavigationService.go(context, SignInPage.path);
        }
      },
      builder: (context, state) {
        final bloc = context.read<ProfileBloc>();
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
                    CustomAvatarCard(imageUrl: state.user?.imageUrl ?? ""),
                    const SizedBox(height: 8),
                    Text(
                      "${state.user?.firstname ?? ""} ${state.user?.lastname ?? ""}",
                      style: AppStyles.titleXLSemibold,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      state.user?.phone != null ? "+${state.user?.phone}" : "",
                      textAlign: TextAlign.center,
                      style: AppStyles.labelLGSemibold.copyWith(
                        color: AppColors.black400,
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),
                  ProfileCard(
                    icon: CupertinoIcons.bag,
                    title: context.tr(LocaleKeys.my_orders),
                    onTap: () => NavigationService.push(context, MyOrderPage.path),
                  ),

                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        () => LanguageBottomSheet.showBottomSheet(
                          context: context,
                        ),
                    flag: LangService.langIcon(context.locale.languageCode),
                    icon: CupertinoIcons.globe,
                    title: context.tr(LocaleKeys.change_language),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        () => LauncherService.launcherApplication(
                          AppConstants.support,
                        ),
                    icon: CupertinoIcons.bubble_left_bubble_right,
                    title: context.tr(LocaleKeys.support),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap: () {
                      if (Platform.isIOS) {
                        ShareService.shareUri(context, AppConstants.appStore);
                      } else {
                        ShareService.shareUri(context, AppConstants.playStore);
                      }
                    },
                    icon: CupertinoIcons.share,
                    title: context.tr(LocaleKeys.share_app),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        () => LauncherService.launcherApplication(
                          AppConstants.privacyPolice,
                        ),
                    icon: CupertinoIcons.exclamationmark_shield,
                    title: context.tr(LocaleKeys.privacy_police),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap:
                        () => LauncherService.launcherApplication(
                          AppConstants.termsOfServices,
                        ),
                    icon: CupertinoIcons.info,
                    title: context.tr(LocaleKeys.terms_of_services),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap: () {
                      ProfileLogoutAndDelete.showDialog(
                        context,
                        isDelete: false,
                        onTap: () => bloc.add(ProfileLogOut()),
                      );
                    },
                    icon: CupertinoIcons.square_arrow_right,
                    title: context.tr(LocaleKeys.logout_account),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    onTap: () {
                      ProfileLogoutAndDelete.showDialog(
                        context,
                        isDelete: true,
                        onTap: () => bloc.add(ProfileDelete()),
                      );
                    },
                    isLogout: true,
                    icon: CupertinoIcons.delete,
                    title: context.tr(LocaleKeys.delete_account),
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    icon: CupertinoIcons.building_2_fill,
                    title: 'Business Information',
                    onTap: () {
                      _showBusinessInfoDialog(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    icon: CupertinoIcons.arrow_clockwise,
                    title: 'Refund & Exchange Policy',
                    onTap: () {
                      _showRefundPolicyDialog(context);
                    },
                  ),
                  const SizedBox(height: 16),
                  ProfileCard(
                    icon: CupertinoIcons.cube_box,
                    title: 'Delivery Policy',
                    onTap: () {
                      _showDeliveryPolicyDialog(context);
                    },
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
