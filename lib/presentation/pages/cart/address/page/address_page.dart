import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/bloc/address_bloc.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/widget/address_form_section.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/widget/adress_bottom_bar.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/widget/adress_map_section.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/widget/keyboard_error_handler.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/widget/location_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class AddressPage extends StatelessWidget {
  static const String path = "/address_page";

  final List<CartModel> carts;

  const AddressPage({super.key, required this.carts});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressBloc(),
      child: AddressView(carts: carts),
    );
  }
}

class AddressView extends StatefulWidget {
  final List<CartModel> carts;

  const AddressView({super.key, required this.carts});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _receiverNameController = TextEditingController();
  final _homeNumberController = TextEditingController();
  final _entrancePasswordController = TextEditingController();
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  KakaoMapController? _mapController;
  bool _isMapCreated = false;

  AddressBloc? _addressBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<AddressBloc>().add(AddressMapInitialized());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        _updateControllers(state);
        if (state.selectedLocation != null &&
            _mapController != null &&
            _isMapCreated) {
          _mapController!.setCenter(state.selectedLocation!);
          _mapController!.clearMarker();
          _mapController!.addMarker(
            markers: [
              Marker(
                markerId: 'selected_location',
                latLng: state.selectedLocation!,
              ),
            ],
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.tr(LocaleKeys.deliver_address)),
            actions: [
              BlocBuilder<AddressBloc, AddressState>(
                builder: (context, state) {
                  return IconButton(
                    icon:
                        state.isGettingLocation
                            ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Icon(Icons.my_location),
                    onPressed:
                        state.isGettingLocation
                            ? null
                            : () => context.read<AddressBloc>().add(
                              AddressCurrentLocationRequested(),
                            ),
                    tooltip: context.tr(LocaleKeys.use_current_location),
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AddressMapSection(
                      onMapCreated: _handleMapCreated,
                      onMapTap: _handleMapTap,
                    ),
                    const SizedBox(height: 16),
                    const LocationIndicator(),
                    const SizedBox(height: 16),

                    AddressFormSection(
                      addressController: _addressController,
                      phoneNumberController: _phoneNumberController,
                      receiverNameController: _receiverNameController,
                      homeNumberController: _homeNumberController,
                      entrancePasswordController: _entrancePasswordController,
                      searchController: _searchController,
                      searchFocusNode: _searchFocusNode,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: AddressBottomBar(
            formKey: _formKey,
            carts: widget.carts,
          ),
        ),
      ),
    );
  }

  void _handleMapCreated(KakaoMapController controller) {
    _mapController = controller;
    _isMapCreated = true;
    final state = context.read<AddressBloc>().state;
    if (state.selectedLocation != null) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_isMapCreated && _mapController != null) {
          controller.setCenter(state.selectedLocation!);
          controller.addMarker(
            markers: [
              Marker(
                markerId: 'selected_location',
                latLng: state.selectedLocation!,
              ),
            ],
          );
        }
      });
    }
  }

  void _handleMapTap(LatLng latLng) {
    if (mounted) {
      context.read<AddressBloc>().add(AddressLocationSelected(latLng));
    }
  }

  void _updateControllers(AddressState state) {
    if (_addressController.text != state.address) {
      _addressController.text = state.address ?? '';
    }
    if (_phoneNumberController.text != state.phoneNumber) {
      _phoneNumberController.text = state.phoneNumber ?? '';
    }
    if (_receiverNameController.text != state.receiverName) {
      _receiverNameController.text = state.receiverName ?? '';
    }
    if (_homeNumberController.text != state.homeNumber) {
      _homeNumberController.text = state.homeNumber ?? '';
    }
    if (_entrancePasswordController.text != state.entrancePassword) {
      _entrancePasswordController.text = state.entrancePassword ?? '';
    }
  }

  @override
  void dispose() {
    _mapController = null;
    _isMapCreated = false;
    _addressController.dispose();
    _phoneNumberController.dispose();
    _receiverNameController.dispose();
    _homeNumberController.dispose();
    _entrancePasswordController.dispose();
    _addressBloc?.add(AddressDispose());
    _addressBloc = null;
    super.dispose();
  }
}
