// lib/presentation/pages/cart/address/bloc/address_bloc.dart
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/address_model.dart';
import 'package:commerce_mobile/data/models/cart_model.dart';
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
