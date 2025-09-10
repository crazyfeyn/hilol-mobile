// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SignInState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  SignInParam? get auth => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
    SignInState value,
    $Res Function(SignInState) then,
  ) = _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    SignInParam? auth,
    bool obscureText,
  });
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? auth = freezed,
    Object? obscureText = null,
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
                        as SignInParam?,
            obscureText:
                null == obscureText
                    ? _value.obscureText
                    : obscureText // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
    _$SignInStateImpl value,
    $Res Function(_$SignInStateImpl) then,
  ) = __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    SignInParam? auth,
    bool obscureText,
  });
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
    _$SignInStateImpl _value,
    $Res Function(_$SignInStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? auth = freezed,
    Object? obscureText = null,
  }) {
    return _then(
      _$SignInStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        auth:
            freezed == auth
                ? _value.auth
                : auth // ignore: cast_nullable_to_non_nullable
                    as SignInParam?,
        obscureText:
            null == obscureText
                ? _value.obscureText
                : obscureText // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$SignInStateImpl extends _SignInState {
  const _$SignInStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    this.auth = null,
    this.obscureText = true,
  }) : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  @JsonKey()
  final SignInParam? auth;
  @override
  @JsonKey()
  final bool obscureText;

  @override
  String toString() {
    return 'SignInState(formzStatus: $formzStatus, auth: $auth, obscureText: $obscureText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.auth, auth) || other.auth == auth) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formzStatus, auth, obscureText);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState extends SignInState {
  const factory _SignInState({
    final FormzSubmissionStatus formzStatus,
    final SignInParam? auth,
    final bool obscureText,
  }) = _$SignInStateImpl;
  const _SignInState._() : super._();

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  SignInParam? get auth;
  @override
  bool get obscureText;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
