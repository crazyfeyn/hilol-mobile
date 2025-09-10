// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SignUpState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  SignUpModel? get auth => throw _privateConstructorUsedError;
  String? get clientId => throw _privateConstructorUsedError;
  bool get obscureText1 => throw _privateConstructorUsedError;
  bool get obscureText2 => throw _privateConstructorUsedError;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
    SignUpState value,
    $Res Function(SignUpState) then,
  ) = _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    SignUpModel? auth,
    String? clientId,
    bool obscureText1,
    bool obscureText2,
  });
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? auth = freezed,
    Object? clientId = freezed,
    Object? obscureText1 = null,
    Object? obscureText2 = null,
  }) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            auth:
                freezed == auth
                    ? _value.auth
                    : auth // ignore: cast_nullable_to_non_nullable
                        as SignUpModel?,
            clientId:
                freezed == clientId
                    ? _value.clientId
                    : clientId // ignore: cast_nullable_to_non_nullable
                        as String?,
            obscureText1:
                null == obscureText1
                    ? _value.obscureText1
                    : obscureText1 // ignore: cast_nullable_to_non_nullable
                        as bool,
            obscureText2:
                null == obscureText2
                    ? _value.obscureText2
                    : obscureText2 // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
    _$SignUpStateImpl value,
    $Res Function(_$SignUpStateImpl) then,
  ) = __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    SignUpModel? auth,
    String? clientId,
    bool obscureText1,
    bool obscureText2,
  });
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
    _$SignUpStateImpl _value,
    $Res Function(_$SignUpStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? auth = freezed,
    Object? clientId = freezed,
    Object? obscureText1 = null,
    Object? obscureText2 = null,
  }) {
    return _then(
      _$SignUpStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        auth:
            freezed == auth
                ? _value.auth
                : auth // ignore: cast_nullable_to_non_nullable
                    as SignUpModel?,
        clientId:
            freezed == clientId
                ? _value.clientId
                : clientId // ignore: cast_nullable_to_non_nullable
                    as String?,
        obscureText1:
            null == obscureText1
                ? _value.obscureText1
                : obscureText1 // ignore: cast_nullable_to_non_nullable
                    as bool,
        obscureText2:
            null == obscureText2
                ? _value.obscureText2
                : obscureText2 // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$SignUpStateImpl extends _SignUpState {
  const _$SignUpStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    this.auth = null,
    this.clientId = null,
    this.obscureText1 = true,
    this.obscureText2 = true,
  }) : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  @JsonKey()
  final SignUpModel? auth;
  @override
  @JsonKey()
  final String? clientId;
  @override
  @JsonKey()
  final bool obscureText1;
  @override
  @JsonKey()
  final bool obscureText2;

  @override
  String toString() {
    return 'SignUpState(formzStatus: $formzStatus, auth: $auth, clientId: $clientId, obscureText1: $obscureText1, obscureText2: $obscureText2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.obscureText1, obscureText1) ||
                other.obscureText1 == obscureText1) &&
            (identical(other.obscureText2, obscureText2) ||
                other.obscureText2 == obscureText2));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    formzStatus,
    auth,
    clientId,
    obscureText1,
    obscureText2,
  );

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState extends SignUpState {
  const factory _SignUpState({
    final FormzSubmissionStatus formzStatus,
    final SignUpModel? auth,
    final String? clientId,
    final bool obscureText1,
    final bool obscureText2,
  }) = _$SignUpStateImpl;
  const _SignUpState._() : super._();

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  SignUpModel? get auth;
  @override
  String? get clientId;
  @override
  bool get obscureText1;
  @override
  bool get obscureText2;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
