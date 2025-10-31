import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:commerce_mobile/data/models/address_model.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/presentation/pages/cart/payment/page/payment_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class AddressPage extends StatefulWidget {
  static const String path = "/address_page";

  final List<CartModel> carts;

  const AddressPage({super.key, required this.carts});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _receiverNameController = TextEditingController();
  final _homeNumberController = TextEditingController();
  final _entrancePasswordController = TextEditingController();

  @override
  void initState() {
    final user = DBService.getUserData();
    final address = DBService.getAddressData();
    _phoneNumberController.text = "+${user?.phone ?? ""}";
    _addressController.text = address?.address ?? "";
    _receiverNameController.text = address?.receiverName ?? "";
    _homeNumberController.text = address?.homeNumber ?? "";
    _entrancePasswordController.text = address?.entrancePassword ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.deliver_address)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: KakaoMap(
                  onMapCreated: ((controller) {}),
                ),
              ),
              CustomTextField(
                title: context.tr(LocaleKeys.address_title),
                hintText: context.tr(LocaleKeys.address_hint),
                ctr: _addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(
                      LocaleKeys.address_error_field_empty,
                    );
                  }
                  return null;
                },
              ),
              CustomTextField(
                readOnly: true,
                title: context.tr(LocaleKeys.phone_number),
                hintText: context.tr(LocaleKeys.phone_number_hint),
                ctr: _phoneNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(
                      LocaleKeys.phone_number_error_field_empty,
                    );
                  }
                  return null;
                },
              ),
              CustomTextField(
                title: context.tr(LocaleKeys.full_name_title),
                hintText: context.tr(LocaleKeys.full_name_hint),
                ctr: _receiverNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(
                      LocaleKeys.full_name_error_field_empty,
                    );
                  }
                  return null;
                },
              ),
              CustomTextField(
                title: context.tr(LocaleKeys.home_number_title),
                hintText: context.tr(LocaleKeys.home_number_hint),
                ctr: _homeNumberController,
              ),
              CustomTextField(
                title: context.tr(LocaleKeys.entrance_password_title),
                hintText: context.tr(LocaleKeys.entrance_password_hint),
                ctr: _entrancePasswordController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
          bottom: MediaQuery.viewPaddingOf(context).bottom + 8,
        ),
        child: CustomElevatedButton(
          onTap: () {
            if(_formKey.currentState!.validate()) {
              final address = _addressController.text.trim();
              final phone = _phoneNumberController.text.trim();
              final receiverName = _receiverNameController.text.trim();
              final homeNumber = _homeNumberController.text.trim();
              final entrancePassword = _entrancePasswordController.text.trim();
              final addressData = AddressModel(
                address: address,
                phoneNumber: phone,
                receiverName: receiverName,
                homeNumber: homeNumber,
                entrancePassword: entrancePassword,
              );
              DBService.setAddressData(addressData);

              final extra = { "address": addressData, "carts": widget.carts };
              NavigationService.push(context, PaymentPage.path, extra: extra);
            }
          },
          title: context.tr(LocaleKeys.continue_btn),
        ),
      ),
    );
  }
}
