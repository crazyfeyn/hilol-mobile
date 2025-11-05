// lib/presentation/pages/cart/address/widgets/address_bottom_bar.dart

import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/address_model.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/bloc/address_bloc.dart';
import 'package:commerce_mobile/presentation/pages/cart/payment/page/payment_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBottomBar extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<CartModel> carts;

  const AddressBottomBar({
    super.key,
    required this.formKey,
    required this.carts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
        bottom: MediaQuery.viewPaddingOf(context).bottom + 8,
      ),
      child: BlocBuilder<AddressBloc, AddressState>(
        buildWhen:
            (previous, current) =>
                previous.address != current.address ||
                previous.phoneNumber != current.phoneNumber ||
                previous.receiverName != current.receiverName ||
                previous.homeNumber != current.homeNumber ||
                previous.entrancePassword != current.entrancePassword,
        builder: (context, state) {
          return CustomElevatedButton(
            onTap: () => _handleContinue(context, state),
            title: context.tr(LocaleKeys.continue_btn),
          );
        },
      ),
    );
  }

  void _handleContinue(BuildContext context, AddressState state) {
    if (formKey.currentState!.validate()) {
      context.read<AddressBloc>().add(AddressSubmitted(carts));

      final addressData = AddressModel(
        address: state.address,
        phoneNumber: state.phoneNumber,
        receiverName: state.receiverName,
        homeNumber: state.homeNumber,
        entrancePassword: state.entrancePassword,
      );

      final extra = {"address": addressData, "carts": carts};
      NavigationService.push(context, PaymentPage.path, extra: extra);
    }
  }
}
