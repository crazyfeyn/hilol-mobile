import 'dart:io' show Platform;
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileLogoutAndDelete extends StatelessWidget {
  final bool isDelete;
  final VoidCallback? onTap;
  const ProfileLogoutAndDelete({super.key, required this.isDelete, this.onTap});

  static showDialog(BuildContext context, {required bool isDelete, VoidCallback? onTap}) async {
    return await showCupertinoDialog(
      context: context,
      builder: (_) => ProfileLogoutAndDelete(isDelete: isDelete),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Text(isDelete ? context.tr(LocaleKeys.delete_account) : context.tr(LocaleKeys.logout_account)),
        content: Text(
          isDelete
              ? context.tr(LocaleKeys.delete_account_prompt)
              : context.tr(LocaleKeys.logout_account_prompt),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(context.tr(LocaleKeys.cancel_btn)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: Text(isDelete ? context.tr(LocaleKeys.delete_btn) : context.tr(LocaleKeys.exit_btn)),
            onPressed: () {
              Navigator.of(context).pop();
              onTap?.call();
            },
          ),
        ],
      );
    }

    return AlertDialog(
      actionsPadding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(isDelete ? context.tr(LocaleKeys.delete_account) : context.tr(LocaleKeys.logout_account)),
      content: Text(
        isDelete
            ? context.tr(LocaleKeys.delete_account_prompt)
            : context.tr(LocaleKeys.logout_account_prompt),
      ),
      actions: [
        TextButton(
          child: Text(context.tr(LocaleKeys.cancel_btn)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(
            isDelete ? context.tr(LocaleKeys.delete_btn) : context.tr(LocaleKeys.exit_btn),
            style: const TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onTap?.call();
          },
        ),
      ],
    );
  }
}
