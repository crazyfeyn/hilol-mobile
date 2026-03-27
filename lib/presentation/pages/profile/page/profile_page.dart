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
          title: Text(
            context.tr(LocaleKeys.business_information),
            style: AppStyles.titleLGSemibold,
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildInfoRow(
                  context.tr(LocaleKeys.business_name),
                  context.tr(LocaleKeys.business_name_value),
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context.tr(LocaleKeys.business_registration_number),
                  context.tr(LocaleKeys.business_registration_value),
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context.tr(LocaleKeys.representative_name),
                  context.tr(LocaleKeys.representative_name_value),
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context.tr(LocaleKeys.business_address),
                  context.tr(LocaleKeys.business_address_value),
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context.tr(LocaleKeys.customer_service),
                  context.tr(LocaleKeys.customer_service_value),
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context.tr(LocaleKeys.ecommerce_registration),
                  context.tr(LocaleKeys.ecommerce_registration_value),
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context.tr(LocaleKeys.refund_inquiries),
                  context.tr(LocaleKeys.refund_inquiries_value),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                context.tr(LocaleKeys.cancel),
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
            context.tr(LocaleKeys.refund_and_exchange_policy),
            style: AppStyles.titleLGSemibold,
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.tr(LocaleKeys.refund_policy),
                  style: AppStyles.labelLGSemibold.copyWith(
                    color: AppColors.black950,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.tr(LocaleKeys.refund_policy_detail),
                  style: AppStyles.bodySMRegular.copyWith(
                    color: AppColors.black600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  context.tr(LocaleKeys.refund_inquiries),
                  style: AppStyles.labelLGSemibold.copyWith(
                    color: AppColors.black950,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.tr(LocaleKeys.refund_inquiries_value),
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
                context.tr(LocaleKeys.close),
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
          title: Text(
            context.tr(LocaleKeys.delivery_policy),
            style: AppStyles.titleLGSemibold,
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.tr(LocaleKeys.delivery_information),
                  style: AppStyles.labelLGSemibold.copyWith(
                    color: AppColors.black950,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.tr(LocaleKeys.delivery_information_detail),
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
                context.tr(LocaleKeys.close),
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // Handle logout success
        if (state.logoutStatus.isSuccess) {
          NavigationService.go(context, SignInPage.path);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr(LocaleKeys.logout_success)),
              backgroundColor: Colors.green,
            ),
          );
        }

        // Handle delete success
        if (state.deleteStatus.isSuccess) {
          NavigationService.go(context, SignInPage.path);
        }

        // Handle delete failure
        if (state.deleteStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr(LocaleKeys.failed_to_delete_account)),
              backgroundColor: Colors.red,
            ),
          );
        }

        // Handle logout failure
        if (state.logoutStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.tr(LocaleKeys.failed_to_logout)),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<ProfileBloc>();

        // Show loading overlay when delete is in progress
        if (state.deleteStatus.isInProgress) {
          return Stack(
            children: [
              _buildProfileContent(context, state, bloc),
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        return _buildProfileContent(context, state, bloc);
      },
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    ProfileState state,
    ProfileBloc bloc,
  ) {
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
                    () => LanguageBottomSheet.showBottomSheet(context: context),
                flag: LangService.langIcon(context.locale.languageCode),
                icon: CupertinoIcons.globe,
                title: context.tr(LocaleKeys.change_language),
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
                icon: CupertinoIcons.building_2_fill,
                title: context.tr(LocaleKeys.business_information),
                onTap: () {
                  _showBusinessInfoDialog(context);
                },
              ),
              const SizedBox(height: 16),
              ProfileCard(
                icon: CupertinoIcons.arrow_clockwise,
                title: context.tr(LocaleKeys.refund_and_exchange_policy),
                onTap: () {
                  _showRefundPolicyDialog(context);
                },
              ),
              const SizedBox(height: 16),
              ProfileCard(
                icon: CupertinoIcons.cube_box,
                title: context.tr(LocaleKeys.delivery_policy),
                onTap: () {
                  _showDeliveryPolicyDialog(context);
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
