import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/address/bloc/address_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class AddressMapSection extends StatelessWidget {
  final Function(KakaoMapController) onMapCreated;
  final Function(LatLng) onMapTap;

  const AddressMapSection({
    super.key,
    required this.onMapCreated,
    required this.onMapTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          KakaoMap(
            onMapCreated: onMapCreated,
            onMapTap: onMapTap,
            center: LatLng(35.8468, 127.1299),
            currentLevel: 5,
            zoomControl: true,
            zoomControlPosition: ControlPosition.right,
            markers: [],
          ),
          BlocBuilder<AddressBloc, AddressState>(
            buildWhen:
                (previous, current) =>
                    previous.isLoadingAddress != current.isLoadingAddress,
            builder: (context, state) {
              if (!state.isLoadingAddress) return const SizedBox();

              return Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          context.tr(LocaleKeys.loading_address),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
