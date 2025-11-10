import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/address_model.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/presentation/pages/address/bloc/address_bloc.dart';
import 'package:commerce_mobile/presentation/pages/address/page/location_image.dart';
import 'package:commerce_mobile/presentation/pages/order/bloc/order_bloc.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

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
      child: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, orderState) {
          if (!context.mounted) return;
          if (orderState.isSuccess) {
            // final addressState = context.read<AddressBloc>().state;
            // final addressData = AddressModel(
            //   address: addressState.address,
            //   phoneNumber: addressState.phoneNumber,
            //   receiverName: addressState.receiverName,
            //   homeNumber: addressState.homeNumber,
            //   entrancePassword: addressState.entrancePassword,
            // );

            NavigationService.push(context, LocationImagePage.path, extra: orderState.orderData!);
          } else if (orderState.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  orderState.errorMessage ??
                      'Buyurtma yaratishda xatolik yuz berdi',
                ),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'Qayta urinish',
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<OrderBloc>().add(
                      const OrderEvent.retryOrder(),
                    );
                  },
                ),
              ),
            );
          }
        },
        builder: (context, orderState) {
          return BlocBuilder<AddressBloc, AddressState>(
            buildWhen:
                (previous, current) =>
                    previous.address != current.address ||
                    previous.phoneNumber != current.phoneNumber ||
                    previous.receiverName != current.receiverName ||
                    previous.homeNumber != current.homeNumber ||
                    previous.entrancePassword != current.entrancePassword,
            builder: (context, addressState) {
              final isLoading = orderState.isCreatingOrder;

              return CustomElevatedButton(
                onTap:
                    isLoading
                        ? null
                        : () => _handleContinue(context, addressState),
                title:
                    isLoading
                        ? context.tr(LocaleKeys.creating_order)
                        : context.tr(LocaleKeys.make_order),
                isLoading: isLoading,
              );
            },
          );
        },
      ),
    );
  }

  // In address_bottom_bar.dart
  void _handleContinue(BuildContext context, AddressState state) {
    if (formKey.currentState!.validate()) {
      context.read<AddressBloc>().add(AddressSubmitted(carts));

      final products =
          carts
              .map(
                (cart) => OrderProductRequest(
                  productId: cart.id ?? 0,
                  amount: cart.amount ?? 0,
                ),
              )
              .toList();
      final orderLocation = OrderLocation(
        city: state.city ?? '',
        region: state.region ?? '',
        street: state.street ?? '',
        altitude: state.selectedLocation?.latitude ?? 0.0,
        longitude: state.selectedLocation?.longitude ?? 0.0,
      );

      final orderModel = OrderModel(
        products: products,
        receiverName: state.receiverName ?? '',
        receiverPhone: state.phoneNumber ?? '',
        receiverAddress: state.address ?? '',
        additionalInfo: _buildAdditionalInfo(state),
        location: orderLocation,
      );

      context.read<OrderBloc>().add(
        OrderEvent.validateOrder(orderModel: orderModel),
      );

      final orderBloc = context.read<OrderBloc>();
      Future.delayed(const Duration(milliseconds: 100), () {
        if (orderBloc.state.isOrderValid) {
          final requestUUID = const Uuid().v4();
          orderBloc.add(
            OrderEvent.createOrder(
              orderModel: orderModel,
              requestUUID: requestUUID,
            ),
          );
        } else if (orderBloc.state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                orderBloc.state.errorMessage ?? 'Maʼlumotlarni tekshiring',
              ),
              backgroundColor: Colors.orange,
            ),
          );
        }
      });
    }
  }

  String _buildAdditionalInfo(AddressState state) {
    final List<String> infoParts = [];

    if (state.homeNumber != null && state.homeNumber!.isNotEmpty) {
      infoParts.add('Uy raqami: ${state.homeNumber}');
    }

    if (state.entrancePassword != null && state.entrancePassword!.isNotEmpty) {
      infoParts.add('Kirish kodi: ${state.entrancePassword}');
    }

    return infoParts.join(' | ');
  }
}
