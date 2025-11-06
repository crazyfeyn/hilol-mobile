part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus formzStatus,

    @Default(false) bool isMapReady,
    @Default(false) bool isLoadingAddress,
    @Default(false) bool isGettingLocation,

    @Default(false) bool isUploadingImage,
    @Default(null) UploadLocationImageModel? uploadResponse,
    @Default(null) String? uploadErrorMessage,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus uploadStatus,

    @Default(null) LatLng? selectedLocation,

    @Default(null) String? address,
    @Default(null) String? phoneNumber,
    @Default(null) String? receiverName,
    @Default(null) String? homeNumber,
    @Default(null) String? entrancePassword,

    @Default(false) bool isAddressValid,
    @Default(false) bool isPhoneNumberValid,
    @Default(false) bool isReceiverNameValid,

    @Default(false) bool isSearching,
    @Default([]) List<PlaceSearchResult> searchResults,
    @Default(null) PlaceSearchResult? selectedPlace,
    @Default('') String searchQuery,

    @Default(null) String? errorMessage,
  }) = _AddressState;

  const AddressState._();
}
