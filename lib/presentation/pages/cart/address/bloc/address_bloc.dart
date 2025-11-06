// lib/presentation/pages/cart/address/bloc/address_bloc.dart
// ignore: depend_on_referenced_packages
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/address_model.dart';
import 'package:commerce_mobile/data/models/adress_location_image_model.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
import 'package:commerce_mobile/data/models/place_search_model.dart';
import 'package:commerce_mobile/data/repositories/address_repository_impl.dart';
import 'package:commerce_mobile/data/datasources/database/db_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

part 'address_event.dart';
part 'address_states.dart';
part 'address_bloc.freezed.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final _repository = AddressRepositoryImpl();

  AddressBloc() : super(const AddressState()) {
    on<AddressMapInitialized>((event, emit) {
      emit(state.copyWith(isMapReady: true));
    });

    on<AddressLocationSelected>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(
        state.copyWith(
          formzStatus: formzStatus,
          selectedLocation: event.latLng,
          isLoadingAddress: true,
        ),
      );

      final result = await _repository.reverseGeocode(event.latLng);

      if (result.isRight()) {
        final address = result.getOrElse(
          () => throw Exception("Unexpected error"),
        );
        formzStatus = FormzSubmissionStatus.success;
        emit(
          state.copyWith(
            formzStatus: formzStatus,
            address: address,
            isLoadingAddress: false,
            isAddressValid: address.isNotEmpty,
          ),
        );
      } else {
        formzStatus = FormzSubmissionStatus.failure;
        emit(state.copyWith(formzStatus: formzStatus, isLoadingAddress: false));
      }
    });

    on<AddressCurrentLocationRequested>((event, emit) async {
      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus, isGettingLocation: true));

      final result = await _repository.getCurrentLocation();
      if (result.isRight()) {
        final position = result.getOrElse(
          () => throw Exception("Unexpected error"),
        );
        final currentLocation = LatLng(position.latitude, position.longitude);
        final addressResult = await _repository.reverseGeocode(currentLocation);

        if (addressResult.isRight()) {
          final address = addressResult.getOrElse(
            () => throw Exception("Unexpected error"),
          );
          formzStatus = FormzSubmissionStatus.success;
          emit(
            state.copyWith(
              formzStatus: formzStatus,
              selectedLocation: currentLocation,
              address: address,
              isGettingLocation: false,
              isAddressValid: address.isNotEmpty,
            ),
          );
        } else {
          formzStatus = FormzSubmissionStatus.failure;
          emit(
            state.copyWith(formzStatus: formzStatus, isGettingLocation: false),
          );
        }
      } else {
        formzStatus = FormzSubmissionStatus.failure;
        emit(
          state.copyWith(formzStatus: formzStatus, isGettingLocation: false),
        );
      }
    });

    on<AddressChanged>((event, emit) {
      emit(
        state.copyWith(
          address: event.address,
          isAddressValid:
              event.address.isNotEmpty && state.selectedLocation != null,
        ),
      );
    });

    on<AddressPhoneNumberChanged>((event, emit) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });

    on<AddressReceiverNameChanged>((event, emit) {
      emit(state.copyWith(receiverName: event.receiverName));
    });

    on<AddressHomeNumberChanged>((event, emit) {
      emit(state.copyWith(homeNumber: event.homeNumber));
    });

    on<AddressEntrancePasswordChanged>((event, emit) {
      emit(state.copyWith(entrancePassword: event.entrancePassword));
    });

    on<AddressSubmitted>((event, emit) async {
      if (state.address == null || state.address!.isEmpty) {
        return;
      }

      if (state.selectedLocation == null) {
        return;
      }

      if (state.receiverName == null || state.receiverName!.isEmpty) {
        return;
      }

      FormzSubmissionStatus formzStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(formzStatus: formzStatus));

      try {
        final addressData = AddressModel(
          address: state.address,
          phoneNumber: state.phoneNumber,
          receiverName: state.receiverName,
          homeNumber: state.homeNumber,
          entrancePassword: state.entrancePassword,
          latitute: state.selectedLocation!.latitude,
          longitude: state.selectedLocation!.longitude,
        );

        await DBService.setAddressData(addressData);
        formzStatus = FormzSubmissionStatus.success;
      } catch (e) {
        formzStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(formzStatus: formzStatus));
    });

    on<AddressSearchQueryChanged>((event, emit) async {
      if (event.query.isEmpty) {
        emit(
          state.copyWith(
            searchResults: [],
            searchQuery: '',
            isSearching: false,
          ),
        );
        return;
      }

      emit(state.copyWith(searchQuery: event.query, isSearching: true));

      final result = await _repository.searchAddress(event.query);

      result.fold(
        (error) =>
            emit(state.copyWith(errorMessage: error, isSearching: false)),
        (results) =>
            emit(state.copyWith(searchResults: results, isSearching: false)),
      );
    });

    on<AddressSearchPlaceSelected>((event, emit) {
      final latLng = LatLng(event.place.y, event.place.x);
      emit(
        state.copyWith(
          selectedPlace: event.place,
          selectedLocation: latLng,
          address:
              event.place.roadAddressName.isNotEmpty
                  ? event.place.roadAddressName
                  : event.place.addressName,
        ),
      );
    });

    on<AddressSearchCleared>((event, emit) {
      emit(
        state.copyWith(searchResults: [], searchQuery: '', selectedPlace: null),
      );
    });

    on<AddressLocationImageUploadRequested>((event, emit) async {
      // Generate unique request UUID
      final requestUUID = 'upload_${DateTime.now().millisecondsSinceEpoch}';

      emit(
        state.copyWith(
          isUploadingImage: true,
          uploadStatus: FormzSubmissionStatus.inProgress,
          uploadErrorMessage: null,
          uploadResponse: null,
        ),
      );

      final result = await _repository.uploadLocationImage(
        orderId: event.orderId,
        imageFile: event.imageFile,
        requestUUID: requestUUID,
      );

      result.fold(
        // Upload failed
        (error) {
          emit(
            state.copyWith(
              isUploadingImage: false,
              uploadStatus: FormzSubmissionStatus.failure,
              uploadErrorMessage: error,
            ),
          );
          add(AddressLocationImageUploadFailure(error));
        },
        // Upload successful
        (uploadResponse) {
          emit(
            state.copyWith(
              isUploadingImage: false,
              uploadStatus: FormzSubmissionStatus.success,
              uploadResponse: uploadResponse,
              uploadErrorMessage: null,
            ),
          );
          add(AddressLocationImageUploadSuccess(uploadResponse));
        },
      );
    });

    on<AddressLocationImageUploadSuccess>((event, emit) {
      // You can add additional success handling here if needed
      // For example, update order status or show success message
      emit(
        state.copyWith(
          uploadResponse: event.uploadResponse,
          uploadStatus: FormzSubmissionStatus.success,
        ),
      );
    });

    on<AddressLocationImageUploadFailure>((event, emit) {
      // You can add additional error handling here if needed
      emit(
        state.copyWith(
          uploadErrorMessage: event.errorMessage,
          uploadStatus: FormzSubmissionStatus.failure,
        ),
      );
    });

    on<AddressLocationImageUploadCleared>((event, emit) {
      emit(
        state.copyWith(
          uploadResponse: null,
          uploadErrorMessage: null,
          uploadStatus: FormzSubmissionStatus.initial,
          isUploadingImage: false,
        ),
      );
    });

    on<AddressDispose>((event, emit) => _repository.dispose());
    _loadInitialData();
  }

  void _loadInitialData() {
    final user = DBService.getUserData();
    final address = DBService.getAddressData();

    add(AddressPhoneNumberChanged("+${user?.phone ?? ""}"));
    if (address?.address != null) {
      add(AddressChanged(address!.address!));
    }
    if (address?.receiverName != null) {
      add(AddressReceiverNameChanged(address!.receiverName!));
    }
    if (address?.homeNumber != null) {
      add(AddressHomeNumberChanged(address!.homeNumber!));
    }
    if (address?.entrancePassword != null) {
      add(AddressEntrancePasswordChanged(address!.entrancePassword!));
    }
  }
}
