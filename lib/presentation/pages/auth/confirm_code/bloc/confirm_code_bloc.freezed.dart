// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ConfirmCodeState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  SignInParam? get auth => throw _privateConstructorUsedError;

  /// Create a copy of ConfirmCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfirmCodeStateCopyWith<ConfirmCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmCodeStateCopyWith<$Res> {
  factory $ConfirmCodeStateCopyWith(
    ConfirmCodeState value,
    $Res Function(ConfirmCodeState) then,
  ) = _$ConfirmCodeStateCopyWithImpl<$Res, ConfirmCodeState>;
  @useResult
  $Res call({FormzSubmissionStatus formzStatus, SignInParam? auth});
}

/// @nodoc
class _$ConfirmCodeStateCopyWithImpl<$Res, $Val extends ConfirmCodeState>
    implements $ConfirmCodeStateCopyWith<$Res> {
  _$ConfirmCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfirmCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? formzStatus = null, Object? auth = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConfirmCodeStateImplCopyWith<$Res>
    implements $ConfirmCodeStateCopyWith<$Res> {
  factory _$$ConfirmCodeStateImplCopyWith(
    _$ConfirmCodeStateImpl value,
    $Res Function(_$ConfirmCodeStateImpl) then,
  ) = __$$ConfirmCodeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzSubmissionStatus formzStatus, SignInParam? auth});
}

/// @nodoc
class __$$ConfirmCodeStateImplCopyWithImpl<$Res>
    extends _$ConfirmCodeStateCopyWithImpl<$Res, _$ConfirmCodeStateImpl>
    implements _$$ConfirmCodeStateImplCopyWith<$Res> {
  __$$ConfirmCodeStateImplCopyWithImpl(
    _$ConfirmCodeStateImpl _value,
    $Res Function(_$ConfirmCodeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConfirmCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? formzStatus = null, Object? auth = freezed}) {
    return _then(
      _$ConfirmCodeStateImpl(
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
      ),
    );
  }
}

/// @nodoc

class _$ConfirmCodeStateImpl extends _ConfirmCodeState {
  const _$ConfirmCodeStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    this.auth = null,
  }) : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  @JsonKey()
  final SignInParam? auth;

  @override
  String toString() {
    return 'ConfirmCodeState(formzStatus: $formzStatus, auth: $auth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmCodeStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.auth, auth) || other.auth == auth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formzStatus, auth);

  /// Create a copy of ConfirmCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmCodeStateImplCopyWith<_$ConfirmCodeStateImpl> get copyWith =>
      __$$ConfirmCodeStateImplCopyWithImpl<_$ConfirmCodeStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ConfirmCodeState extends ConfirmCodeState {
  const factory _ConfirmCodeState({
    final FormzSubmissionStatus formzStatus,
    final SignInParam? auth,
  }) = _$ConfirmCodeStateImpl;
  const _ConfirmCodeState._() : super._();

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  SignInParam? get auth;

  /// Create a copy of ConfirmCodeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmCodeStateImplCopyWith<_$ConfirmCodeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
