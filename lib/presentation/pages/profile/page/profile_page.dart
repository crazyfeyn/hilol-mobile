import 'dart:io';

import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/core/services/launcher_service.dart';
import 'package:commerce_mobile/core/services/share_service.dart';
import 'package:commerce_mobile/core/utils/app_colors.dart';
import 'package:commerce_mobile/core/utils/app_constants.dart';
import 'package:commerce_mobile/core/utils/app_styles.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/profile/page/edit_page.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/custom_avatar_card.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/profile_card.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/profile_logout_and_delete.dart';
import 'package:commerce_mobile/presentation/widgets/language_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomAvatarCard(
                imageUrl: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
              ),
              SizedBox(height: 8),
              Text(
                "Mark Adam",
                style: AppStyles.titleXLSemibold,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                "commerce2025@gmail.com",
                style: AppStyles.labelLGSemibold.copyWith(
                  color: AppColors.black400,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 24),
              ProfileCard(
                onTap: () => NavigationService.push(context, EditPage.path),
                icon: CupertinoIcons.person,
                title: context.tr(LocaleKeys.edit_profile),
              ),
              SizedBox(height: 16),
              ProfileCard(
                icon: CupertinoIcons.bag,
                title: context.tr(LocaleKeys.my_orders),
              ),
              SizedBox(height: 16),
              ProfileCard(
                icon: CupertinoIcons.lock,
                title: context.tr(LocaleKeys.reset_password),
              ),
              SizedBox(height: 16),
              ProfileCard(
                onTap: () => LanguageBottomSheet.showBottomSheet(context: context),
                flag: LangService.langIcon(context.locale.languageCode),
                icon: CupertinoIcons.globe,
                title: context.tr(LocaleKeys.change_language),
              ),
              SizedBox(height: 16),
              ProfileCard(
                onTap: () => LauncherService.launcherApplication(AppConstants.support),
                icon: CupertinoIcons.bubble_left_bubble_right,
                title: context.tr(LocaleKeys.support),
              ),
              SizedBox(height: 16),
              ProfileCard(
                onTap: () {
                  if(Platform.isIOS) {
                    ShareService.shareUri(context, AppConstants.appStore);
                  } else {
                    ShareService.shareUri(context, AppConstants.playStore);
                  }
                },
                icon: CupertinoIcons.share,
                title: context.tr(LocaleKeys.share_app),
              ),
              SizedBox(height: 16),
              ProfileCard(
                onTap: () => LauncherService.launcherApplication(AppConstants.privacyPolice),
                icon: CupertinoIcons.exclamationmark_shield,
                title: context.tr(LocaleKeys.privacy_police),
              ),
              SizedBox(height: 16),
              ProfileCard(
                onTap: () => LauncherService.launcherApplication(AppConstants.termsOfServices),
                icon: CupertinoIcons.info,
                title: context.tr(LocaleKeys.terms_of_services),
              ),
              SizedBox(height: 16),
              ProfileCard(
                onTap: () {
                  ProfileLogoutAndDelete.showDialog(context, isDelete: false);
                },
                icon: CupertinoIcons.square_arrow_right,
                title: context.tr(LocaleKeys.logout_account),
              ),
              SizedBox(height: 16),
              ProfileCard(
                onTap: () {
                  ProfileLogoutAndDelete.showDialog(context, isDelete: true);
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
