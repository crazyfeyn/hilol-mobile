import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/profile/widget/custom_avatar_card.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  static String path = "/edit_page";

  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.tr(LocaleKeys.edit_profile))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 16),
              CustomAvatarCard(
                imageUrl: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
                onChange: (value) {},
              ),

              SizedBox(height: 24),
              CustomTextField(
                title: context.tr(LocaleKeys.full_name_title_field),
                hintText: context.tr(LocaleKeys.full_name_hint_field),
                textCapitalization: TextCapitalization.sentences,
                ctr: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(LocaleKeys.full_name_error_field_empty);
                  }

                  if (value.length < 3) {
                    return context.tr(
                      LocaleKeys.full_name_error_field_too_short,
                    );
                  }

                  return null;
                },
              ),

              SizedBox(height: 16),
              CustomTextField(
                title: context.tr(LocaleKeys.address_title),
                hintText: context.tr(LocaleKeys.address_hint),
                textCapitalization: TextCapitalization.sentences,
                ctr: _addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(LocaleKeys.address_error_field_empty);
                  }

                  return null;
                },
              ),

              // SizedBox(height: 16),
              // CustomTextField(
              //   title: context.tr(LocaleKeys.email),
              //   hintText: context.tr(LocaleKeys.email_hint),
              //   keyboardType: TextInputType.emailAddress,
              //   ctr: _emailController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return context.tr(LocaleKeys.empty_filed);
              //     } else if (!RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
              //       return context.tr(LocaleKeys.email_invalid_format);
              //     }
              //     return null;
              //   },
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: MediaQuery.viewPaddingOf(context).bottom + 8
        ),
        child: CustomElevatedButton(
          onTap: () {},
          title: context.tr(LocaleKeys.save_btn),
        ),
      ),
    );
  }
}
