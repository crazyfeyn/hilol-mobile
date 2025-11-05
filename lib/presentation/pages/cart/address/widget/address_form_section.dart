import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/place_search_model.dart';
import 'package:commerce_mobile/presentation/pages/cart/address/bloc/address_bloc.dart';
import 'package:commerce_mobile/presentation/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class AddressFormSection extends StatefulWidget {
  final TextEditingController addressController;
  final TextEditingController phoneNumberController;
  final TextEditingController receiverNameController;
  final TextEditingController homeNumberController;
  final TextEditingController entrancePasswordController;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final KakaoMapController? mapController;
  final bool isMapCreated;

  const AddressFormSection({
    super.key,
    required this.addressController,
    required this.phoneNumberController,
    required this.receiverNameController,
    required this.homeNumberController,
    required this.entrancePasswordController,
    required this.searchController,
    required this.searchFocusNode,
    this.mapController,
    this.isMapCreated = false,
  });

  @override
  State<AddressFormSection> createState() => _AddressFormSectionState();
}

class _AddressFormSectionState extends State<AddressFormSection> {
  void _selectPlace(BuildContext context, PlaceSearchResult place) {
    final address =
        place.roadAddressName.isNotEmpty
            ? place.roadAddressName
            : place.addressName;

    context.read<AddressBloc>().add(AddressChanged(address));
    context.read<AddressBloc>().add(
      AddressLocationSelected(LatLng(place.y, place.x)),
    );

    widget.addressController.text = address;

    if (widget.mapController != null && widget.isMapCreated) {
      widget.mapController!.setCenter(LatLng(place.y, place.x));
    }

    widget.searchController.clear();
    widget.searchFocusNode.unfocus();
    context.read<AddressBloc>().add(AddressSearchCleared());
  }

  void _selectUserInputAsAddress(BuildContext context, String input) {
    context.read<AddressBloc>().add(AddressChanged(input));
    widget.addressController.text = input;

    widget.searchController.clear();
    widget.searchFocusNode.unfocus();
    context.read<AddressBloc>().add(AddressSearchCleared());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AddressBloc, AddressState>(
          buildWhen:
              (previous, current) =>
                  previous.isLoadingAddress != current.isLoadingAddress ||
                  previous.searchResults != current.searchResults,
          builder: (context, state) {
            return Column(
              children: [
                CustomTextField(
                  readOnly: true,
                  title: context.tr(LocaleKeys.address_title),
                  hintText: context.tr(LocaleKeys.address_hint),
                  ctr: widget.addressController,
                  suffixIcon:
                      state.isLoadingAddress ? Icons.hourglass_empty : null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.tr(LocaleKeys.address_error_field_empty);
                    }
                    if (state.selectedLocation == null) {
                      return context.tr(LocaleKeys.address_error_select_on_map);
                    }
                    return null;
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(LocaleKeys.search_address_title),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: widget.searchController,
                        focusNode: widget.searchFocusNode,
                        decoration: InputDecoration(
                          hintText: context.tr(LocaleKeys.search_address_hint),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey[600],
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        onChanged:
                            (value) => context.read<AddressBloc>().add(
                              AddressSearchQueryChanged(value),
                            ),
                      ),
                    ),

                    if (state.searchResults.isNotEmpty)
                      _buildResultsList(context, state)
                    else if (!state.isLoadingAddress &&
                        widget.searchController.text.isNotEmpty)
                      _buildNoMatchSuggestion(context),
                  ],
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 16),

        CustomTextField(
          readOnly: true,
          title: context.tr(LocaleKeys.phone_number),
          hintText: context.tr(LocaleKeys.phone_number_hint),
          ctr: widget.phoneNumberController,
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
          ctr: widget.receiverNameController,
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
          ctr: widget.homeNumberController,
          onChanged:
              (value) => context.read<AddressBloc>().add(
                AddressHomeNumberChanged(value),
              ),
        ),
        CustomTextField(
          title: context.tr(LocaleKeys.entrance_password_title),
          hintText: context.tr(LocaleKeys.entrance_password_hint),
          ctr: widget.entrancePasswordController,
          onChanged:
              (value) => context.read<AddressBloc>().add(
                AddressEntrancePasswordChanged(value),
              ),
        ),
      ],
    );
  }

  Widget _buildResultsList(BuildContext context, AddressState state) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      constraints: const BoxConstraints(maxHeight: 300),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: state.searchResults.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final place = state.searchResults[index];
          return ListTile(
            leading: Icon(Icons.place, color: Theme.of(context).primaryColor),
            title: Text(
              place.placeName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (place.roadAddressName.isNotEmpty)
                  Text(
                    place.roadAddressName,
                    style: const TextStyle(fontSize: 13),
                  ),
                Text(
                  place.addressName,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            onTap: () => _selectPlace(context, place),
            dense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoMatchSuggestion(BuildContext context) {
    final input = widget.searchController.text.trim();
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.edit_location_alt, color: Colors.blueAccent),
        title: Text(input, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          context.tr(LocaleKeys.no_results_found),
          style: TextStyle(color: Colors.grey[600]),
        ),
        onTap: () => _selectUserInputAsAddress(context, input),
      ),
    );
  }
}
