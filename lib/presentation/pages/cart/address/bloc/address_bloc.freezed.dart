// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddressState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  bool get isMapReady => throw _privateConstructorUsedError;
  bool get isLoadingAddress => throw _privateConstructorUsedError;
  bool get isGettingLocation => throw _privateConstructorUsedError;
  LatLng? get selectedLocation => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get receiverName => throw _privateConstructorUsedError;
  String? get homeNumber => throw _privateConstructorUsedError;
  String? get entrancePassword => throw _privateConstructorUsedError;
  bool get isAddressValid => throw _privateConstructorUsedError;
  bool get isPhoneNumberValid => throw _privateConstructorUsedError;
  bool get isReceiverNameValid =>
      throw _privateConstructorUsedError; // Error handling
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressStateCopyWith<AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
    AddressState value,
    $Res Function(AddressState) then,
  ) = _$AddressStateCopyWithImpl<$Res, AddressState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    bool isMapReady,
    bool isLoadingAddress,
    bool isGettingLocation,
    LatLng? selectedLocation,
    String? address,
    String? phoneNumber,
    String? receiverName,
    String? homeNumber,
    String? entrancePassword,
    bool isAddressValid,
    bool isPhoneNumberValid,
    bool isReceiverNameValid,
    String? errorMessage,
  });
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? isMapReady = null,
    Object? isLoadingAddress = null,
    Object? isGettingLocation = null,
    Object? selectedLocation = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? receiverName = freezed,
    Object? homeNumber = freezed,
    Object? entrancePassword = freezed,
    Object? isAddressValid = null,
    Object? isPhoneNumberValid = null,
    Object? isReceiverNameValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            isMapReady:
                null == isMapReady
                    ? _value.isMapReady
                    : isMapReady // ignore: cast_nullable_to_non_nullable
                        as bool,
            isLoadingAddress:
                null == isLoadingAddress
                    ? _value.isLoadingAddress
                    : isLoadingAddress // ignore: cast_nullable_to_non_nullable
                        as bool,
            isGettingLocation:
                null == isGettingLocation
                    ? _value.isGettingLocation
                    : isGettingLocation // ignore: cast_nullable_to_non_nullable
                        as bool,
            selectedLocation:
                freezed == selectedLocation
                    ? _value.selectedLocation
                    : selectedLocation // ignore: cast_nullable_to_non_nullable
                        as LatLng?,
            address:
                freezed == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String?,
            phoneNumber:
                freezed == phoneNumber
                    ? _value.phoneNumber
                    : phoneNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            receiverName:
                freezed == receiverName
                    ? _value.receiverName
                    : receiverName // ignore: cast_nullable_to_non_nullable
                        as String?,
            homeNumber:
                freezed == homeNumber
                    ? _value.homeNumber
                    : homeNumber // ignore: cast_nullable_to_non_nullable
                        as String?,
            entrancePassword:
                freezed == entrancePassword
                    ? _value.entrancePassword
                    : entrancePassword // ignore: cast_nullable_to_non_nullable
                        as String?,
            isAddressValid:
                null == isAddressValid
                    ? _value.isAddressValid
                    : isAddressValid // ignore: cast_nullable_to_non_nullable
                        as bool,
            isPhoneNumberValid:
                null == isPhoneNumberValid
                    ? _value.isPhoneNumberValid
                    : isPhoneNumberValid // ignore: cast_nullable_to_non_nullable
                        as bool,
            isReceiverNameValid:
                null == isReceiverNameValid
                    ? _value.isReceiverNameValid
                    : isReceiverNameValid // ignore: cast_nullable_to_non_nullable
                        as bool,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddressStateImplCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$$AddressStateImplCopyWith(
    _$AddressStateImpl value,
    $Res Function(_$AddressStateImpl) then,
  ) = __$$AddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    bool isMapReady,
    bool isLoadingAddress,
    bool isGettingLocation,
    LatLng? selectedLocation,
    String? address,
    String? phoneNumber,
    String? receiverName,
    String? homeNumber,
    String? entrancePassword,
    bool isAddressValid,
    bool isPhoneNumberValid,
    bool isReceiverNameValid,
    String? errorMessage,
  });
}

/// @nodoc
class __$$AddressStateImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateImpl>
    implements _$$AddressStateImplCopyWith<$Res> {
  __$$AddressStateImplCopyWithImpl(
    _$AddressStateImpl _value,
    $Res Function(_$AddressStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? isMapReady = null,
    Object? isLoadingAddress = null,
    Object? isGettingLocation = null,
    Object? selectedLocation = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? receiverName = freezed,
    Object? homeNumber = freezed,
    Object? entrancePassword = freezed,
    Object? isAddressValid = null,
    Object? isPhoneNumberValid = null,
    Object? isReceiverNameValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$AddressStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        isMapReady:
            null == isMapReady
                ? _value.isMapReady
                : isMapReady // ignore: cast_nullable_to_non_nullable
                    as bool,
        isLoadingAddress:
            null == isLoadingAddress
                ? _value.isLoadingAddress
                : isLoadingAddress // ignore: cast_nullable_to_non_nullable
                    as bool,
        isGettingLocation:
            null == isGettingLocation
                ? _value.isGettingLocation
                : isGettingLocation // ignore: cast_nullable_to_non_nullable
                    as bool,
        selectedLocation:
            freezed == selectedLocation
                ? _value.selectedLocation
                : selectedLocation // ignore: cast_nullable_to_non_nullable
                    as LatLng?,
        address:
            freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String?,
        phoneNumber:
            freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        receiverName:
            freezed == receiverName
                ? _value.receiverName
                : receiverName // ignore: cast_nullable_to_non_nullable
                    as String?,
        homeNumber:
            freezed == homeNumber
                ? _value.homeNumber
                : homeNumber // ignore: cast_nullable_to_non_nullable
                    as String?,
        entrancePassword:
            freezed == entrancePassword
                ? _value.entrancePassword
                : entrancePassword // ignore: cast_nullable_to_non_nullable
                    as String?,
        isAddressValid:
            null == isAddressValid
                ? _value.isAddressValid
                : isAddressValid // ignore: cast_nullable_to_non_nullable
                    as bool,
        isPhoneNumberValid:
            null == isPhoneNumberValid
                ? _value.isPhoneNumberValid
                : isPhoneNumberValid // ignore: cast_nullable_to_non_nullable
                    as bool,
        isReceiverNameValid:
            null == isReceiverNameValid
                ? _value.isReceiverNameValid
                : isReceiverNameValid // ignore: cast_nullable_to_non_nullable
                    as bool,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$AddressStateImpl extends _AddressState {
  const _$AddressStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    this.isMapReady = false,
    this.isLoadingAddress = false,
    this.isGettingLocation = false,
    this.selectedLocation = null,
    this.address = null,
    this.phoneNumber = null,
    this.receiverName = null,
    this.homeNumber = null,
    this.entrancePassword = null,
    this.isAddressValid = false,
    this.isPhoneNumberValid = false,
    this.isReceiverNameValid = false,
    this.errorMessage = null,
  }) : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  @JsonKey()
  final bool isMapReady;
  @override
  @JsonKey()
  final bool isLoadingAddress;
  @override
  @JsonKey()
  final bool isGettingLocation;
  @override
  @JsonKey()
  final LatLng? selectedLocation;
  @override
  @JsonKey()
  final String? address;
  @override
  @JsonKey()
  final String? phoneNumber;
  @override
  @JsonKey()
  final String? receiverName;
  @override
  @JsonKey()
  final String? homeNumber;
  @override
  @JsonKey()
  final String? entrancePassword;
  @override
  @JsonKey()
  final bool isAddressValid;
  @override
  @JsonKey()
  final bool isPhoneNumberValid;
  @override
  @JsonKey()
  final bool isReceiverNameValid;
  // Error handling
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'AddressState(formzStatus: $formzStatus, isMapReady: $isMapReady, isLoadingAddress: $isLoadingAddress, isGettingLocation: $isGettingLocation, selectedLocation: $selectedLocation, address: $address, phoneNumber: $phoneNumber, receiverName: $receiverName, homeNumber: $homeNumber, entrancePassword: $entrancePassword, isAddressValid: $isAddressValid, isPhoneNumberValid: $isPhoneNumberValid, isReceiverNameValid: $isReceiverNameValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.isMapReady, isMapReady) ||
                other.isMapReady == isMapReady) &&
            (identical(other.isLoadingAddress, isLoadingAddress) ||
                other.isLoadingAddress == isLoadingAddress) &&
            (identical(other.isGettingLocation, isGettingLocation) ||
                other.isGettingLocation == isGettingLocation) &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.homeNumber, homeNumber) ||
                other.homeNumber == homeNumber) &&
            (identical(other.entrancePassword, entrancePassword) ||
                other.entrancePassword == entrancePassword) &&
            (identical(other.isAddressValid, isAddressValid) ||
                other.isAddressValid == isAddressValid) &&
            (identical(other.isPhoneNumberValid, isPhoneNumberValid) ||
                other.isPhoneNumberValid == isPhoneNumberValid) &&
            (identical(other.isReceiverNameValid, isReceiverNameValid) ||
                other.isReceiverNameValid == isReceiverNameValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    formzStatus,
    isMapReady,
    isLoadingAddress,
    isGettingLocation,
    selectedLocation,
    address,
    phoneNumber,
    receiverName,
    homeNumber,
    entrancePassword,
    isAddressValid,
    isPhoneNumberValid,
    isReceiverNameValid,
    errorMessage,
  );

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      __$$AddressStateImplCopyWithImpl<_$AddressStateImpl>(this, _$identity);
}

abstract class _AddressState extends AddressState {
  const factory _AddressState({
    final FormzSubmissionStatus formzStatus,
    final bool isMapReady,
    final bool isLoadingAddress,
    final bool isGettingLocation,
    final LatLng? selectedLocation,
    final String? address,
    final String? phoneNumber,
    final String? receiverName,
    final String? homeNumber,
    final String? entrancePassword,
    final bool isAddressValid,
    final bool isPhoneNumberValid,
    final bool isReceiverNameValid,
    final String? errorMessage,
  }) = _$AddressStateImpl;
  const _AddressState._() : super._();

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  bool get isMapReady;
  @override
  bool get isLoadingAddress;
  @override
  bool get isGettingLocation;
  @override
  LatLng? get selectedLocation;
  @override
  String? get address;
  @override
  String? get phoneNumber;
  @override
  String? get receiverName;
  @override
  String? get homeNumber;
  @override
  String? get entrancePassword;
  @override
  bool get isAddressValid;
  @override
  bool get isPhoneNumberValid;
  @override
  bool get isReceiverNameValid; // Error handling
  @override
  String? get errorMessage;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
