// lib/presentation/pages/cart/address/widgets/address_form_section.dart

import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/bloc/address_bloc.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressFormSection extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController phoneNumberController;
  final TextEditingController receiverNameController;
  final TextEditingController homeNumberController;
  final TextEditingController entrancePasswordController;

  const AddressFormSection({
    super.key,
    required this.addressController,
    required this.phoneNumberController,
    required this.receiverNameController,
    required this.homeNumberController,
    required this.entrancePasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AddressBloc, AddressState>(
          buildWhen:
              (previous, current) =>
                  previous.isLoadingAddress != current.isLoadingAddress,
          builder: (context, state) {
            return CustomTextField(
              title: context.tr(LocaleKeys.address_title),
              hintText: context.tr(LocaleKeys.address_hint),
              ctr: addressController,
              suffixIcon: state.isLoadingAddress ? Icons.hourglass_empty : null,
              onChanged:
                  (value) =>
                      context.read<AddressBloc>().add(AddressChanged(value)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.tr(LocaleKeys.address_error_field_empty);
                }
                if (state.selectedLocation == null) {
                  return context.tr(LocaleKeys.address_error_select_on_map);
                }
                return null;
              },
            );
          },
        ),
        CustomTextField(
          readOnly: true,
          title: context.tr(LocaleKeys.phone_number),
          hintText: context.tr(LocaleKeys.phone_number_hint),
          ctr: phoneNumberController,
          onChanged:
              (value) => context.read<AddressBloc>().add(
                AddressPhoneNumberChanged(value),
              ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.tr(LocaleKeys.phone_number_error_field_empty);
            }
            return null;
          },
        ),
        CustomTextField(
          title: context.tr(LocaleKeys.full_name_title),
          hintText: context.tr(LocaleKeys.full_name_hint),
          ctr: receiverNameController,
          onChanged:
              (value) => context.read<AddressBloc>().add(
                AddressReceiverNameChanged(value),
              ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.tr(LocaleKeys.full_name_error_field_empty);
            }
            return null;
          },
        ),
        CustomTextField(
          title: context.tr(LocaleKeys.home_number_title),
          hintText: context.tr(LocaleKeys.home_number_hint),
          ctr: homeNumberController,
          onChanged:
              (value) => context.read<AddressBloc>().add(
                AddressHomeNumberChanged(value),
              ),
        ),
        CustomTextField(
          title: context.tr(LocaleKeys.entrance_password_title),
          hintText: context.tr(LocaleKeys.entrance_password_hint),
          ctr: entrancePasswordController,
          onChanged:
              (value) => context.read<AddressBloc>().add(
                AddressEntrancePasswordChanged(value),
              ),
        ),
      ],
    );
  }
}
