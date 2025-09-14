// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_pass_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResetPassEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPassRepositoryParam resetPassParam) sendData,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPassRepositoryParam resetPassParam)? sendData,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPassRepositoryParam resetPassParam)? sendData,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPassSendData value) sendData,
    required TResult Function(ResetPassResetStatus value) resetStatus,
    required TResult Function(ResetPassDispose value) dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPassSendData value)? sendData,
    TResult? Function(ResetPassResetStatus value)? resetStatus,
    TResult? Function(ResetPassDispose value)? dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPassSendData value)? sendData,
    TResult Function(ResetPassResetStatus value)? resetStatus,
    TResult Function(ResetPassDispose value)? dispose,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPassEventCopyWith<$Res> {
  factory $ResetPassEventCopyWith(
    ResetPassEvent value,
    $Res Function(ResetPassEvent) then,
  ) = _$ResetPassEventCopyWithImpl<$Res, ResetPassEvent>;
}

/// @nodoc
class _$ResetPassEventCopyWithImpl<$Res, $Val extends ResetPassEvent>
    implements $ResetPassEventCopyWith<$Res> {
  _$ResetPassEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResetPassSendDataImplCopyWith<$Res> {
  factory _$$ResetPassSendDataImplCopyWith(
    _$ResetPassSendDataImpl value,
    $Res Function(_$ResetPassSendDataImpl) then,
  ) = __$$ResetPassSendDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPassRepositoryParam resetPassParam});
}

/// @nodoc
class __$$ResetPassSendDataImplCopyWithImpl<$Res>
    extends _$ResetPassEventCopyWithImpl<$Res, _$ResetPassSendDataImpl>
    implements _$$ResetPassSendDataImplCopyWith<$Res> {
  __$$ResetPassSendDataImplCopyWithImpl(
    _$ResetPassSendDataImpl _value,
    $Res Function(_$ResetPassSendDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? resetPassParam = null}) {
    return _then(
      _$ResetPassSendDataImpl(
        null == resetPassParam
            ? _value.resetPassParam
            : resetPassParam // ignore: cast_nullable_to_non_nullable
                as ResetPassRepositoryParam,
      ),
    );
  }
}

/// @nodoc

class _$ResetPassSendDataImpl implements ResetPassSendData {
  const _$ResetPassSendDataImpl(this.resetPassParam);

  @override
  final ResetPassRepositoryParam resetPassParam;

  @override
  String toString() {
    return 'ResetPassEvent.sendData(resetPassParam: $resetPassParam)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPassSendDataImpl &&
            (identical(other.resetPassParam, resetPassParam) ||
                other.resetPassParam == resetPassParam));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resetPassParam);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPassSendDataImplCopyWith<_$ResetPassSendDataImpl> get copyWith =>
      __$$ResetPassSendDataImplCopyWithImpl<_$ResetPassSendDataImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPassRepositoryParam resetPassParam) sendData,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return sendData(resetPassParam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPassRepositoryParam resetPassParam)? sendData,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return sendData?.call(resetPassParam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPassRepositoryParam resetPassParam)? sendData,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (sendData != null) {
      return sendData(resetPassParam);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPassSendData value) sendData,
    required TResult Function(ResetPassResetStatus value) resetStatus,
    required TResult Function(ResetPassDispose value) dispose,
  }) {
    return sendData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPassSendData value)? sendData,
    TResult? Function(ResetPassResetStatus value)? resetStatus,
    TResult? Function(ResetPassDispose value)? dispose,
  }) {
    return sendData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPassSendData value)? sendData,
    TResult Function(ResetPassResetStatus value)? resetStatus,
    TResult Function(ResetPassDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (sendData != null) {
      return sendData(this);
    }
    return orElse();
  }
}

abstract class ResetPassSendData implements ResetPassEvent {
  const factory ResetPassSendData(
    final ResetPassRepositoryParam resetPassParam,
  ) = _$ResetPassSendDataImpl;

  ResetPassRepositoryParam get resetPassParam;

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPassSendDataImplCopyWith<_$ResetPassSendDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPassResetStatusImplCopyWith<$Res> {
  factory _$$ResetPassResetStatusImplCopyWith(
    _$ResetPassResetStatusImpl value,
    $Res Function(_$ResetPassResetStatusImpl) then,
  ) = __$$ResetPassResetStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetPassResetStatusImplCopyWithImpl<$Res>
    extends _$ResetPassEventCopyWithImpl<$Res, _$ResetPassResetStatusImpl>
    implements _$$ResetPassResetStatusImplCopyWith<$Res> {
  __$$ResetPassResetStatusImplCopyWithImpl(
    _$ResetPassResetStatusImpl _value,
    $Res Function(_$ResetPassResetStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetPassResetStatusImpl implements ResetPassResetStatus {
  const _$ResetPassResetStatusImpl();

  @override
  String toString() {
    return 'ResetPassEvent.resetStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPassResetStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPassRepositoryParam resetPassParam) sendData,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return resetStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPassRepositoryParam resetPassParam)? sendData,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return resetStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPassRepositoryParam resetPassParam)? sendData,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (resetStatus != null) {
      return resetStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPassSendData value) sendData,
    required TResult Function(ResetPassResetStatus value) resetStatus,
    required TResult Function(ResetPassDispose value) dispose,
  }) {
    return resetStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPassSendData value)? sendData,
    TResult? Function(ResetPassResetStatus value)? resetStatus,
    TResult? Function(ResetPassDispose value)? dispose,
  }) {
    return resetStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPassSendData value)? sendData,
    TResult Function(ResetPassResetStatus value)? resetStatus,
    TResult Function(ResetPassDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (resetStatus != null) {
      return resetStatus(this);
    }
    return orElse();
  }
}

abstract class ResetPassResetStatus implements ResetPassEvent {
  const factory ResetPassResetStatus() = _$ResetPassResetStatusImpl;
}

/// @nodoc
abstract class _$$ResetPassDisposeImplCopyWith<$Res> {
  factory _$$ResetPassDisposeImplCopyWith(
    _$ResetPassDisposeImpl value,
    $Res Function(_$ResetPassDisposeImpl) then,
  ) = __$$ResetPassDisposeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetPassDisposeImplCopyWithImpl<$Res>
    extends _$ResetPassEventCopyWithImpl<$Res, _$ResetPassDisposeImpl>
    implements _$$ResetPassDisposeImplCopyWith<$Res> {
  __$$ResetPassDisposeImplCopyWithImpl(
    _$ResetPassDisposeImpl _value,
    $Res Function(_$ResetPassDisposeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPassEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetPassDisposeImpl implements ResetPassDispose {
  const _$ResetPassDisposeImpl();

  @override
  String toString() {
    return 'ResetPassEvent.dispose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetPassDisposeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ResetPassRepositoryParam resetPassParam) sendData,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ResetPassRepositoryParam resetPassParam)? sendData,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ResetPassRepositoryParam resetPassParam)? sendData,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResetPassSendData value) sendData,
    required TResult Function(ResetPassResetStatus value) resetStatus,
    required TResult Function(ResetPassDispose value) dispose,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResetPassSendData value)? sendData,
    TResult? Function(ResetPassResetStatus value)? resetStatus,
    TResult? Function(ResetPassDispose value)? dispose,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResetPassSendData value)? sendData,
    TResult Function(ResetPassResetStatus value)? resetStatus,
    TResult Function(ResetPassDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class ResetPassDispose implements ResetPassEvent {
  const factory ResetPassDispose() = _$ResetPassDisposeImpl;
}

/// @nodoc
mixin _$ResetPassState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  ResetPassTokenModel? get resetPassToken => throw _privateConstructorUsedError;

  /// Create a copy of ResetPassState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPassStateCopyWith<ResetPassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPassStateCopyWith<$Res> {
  factory $ResetPassStateCopyWith(
    ResetPassState value,
    $Res Function(ResetPassState) then,
  ) = _$ResetPassStateCopyWithImpl<$Res, ResetPassState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    ResetPassTokenModel? resetPassToken,
  });
}

/// @nodoc
class _$ResetPassStateCopyWithImpl<$Res, $Val extends ResetPassState>
    implements $ResetPassStateCopyWith<$Res> {
  _$ResetPassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPassState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? formzStatus = null, Object? resetPassToken = freezed}) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            resetPassToken:
                freezed == resetPassToken
                    ? _value.resetPassToken
                    : resetPassToken // ignore: cast_nullable_to_non_nullable
                        as ResetPassTokenModel?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResetPassStateImplCopyWith<$Res>
    implements $ResetPassStateCopyWith<$Res> {
  factory _$$ResetPassStateImplCopyWith(
    _$ResetPassStateImpl value,
    $Res Function(_$ResetPassStateImpl) then,
  ) = __$$ResetPassStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    ResetPassTokenModel? resetPassToken,
  });
}

/// @nodoc
class __$$ResetPassStateImplCopyWithImpl<$Res>
    extends _$ResetPassStateCopyWithImpl<$Res, _$ResetPassStateImpl>
    implements _$$ResetPassStateImplCopyWith<$Res> {
  __$$ResetPassStateImplCopyWithImpl(
    _$ResetPassStateImpl _value,
    $Res Function(_$ResetPassStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResetPassState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? formzStatus = null, Object? resetPassToken = freezed}) {
    return _then(
      _$ResetPassStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        resetPassToken:
            freezed == resetPassToken
                ? _value.resetPassToken
                : resetPassToken // ignore: cast_nullable_to_non_nullable
                    as ResetPassTokenModel?,
      ),
    );
  }
}

/// @nodoc

class _$ResetPassStateImpl implements _ResetPassState {
  const _$ResetPassStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    this.resetPassToken,
  });

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  final ResetPassTokenModel? resetPassToken;

  @override
  String toString() {
    return 'ResetPassState(formzStatus: $formzStatus, resetPassToken: $resetPassToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPassStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.resetPassToken, resetPassToken) ||
                other.resetPassToken == resetPassToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formzStatus, resetPassToken);

  /// Create a copy of ResetPassState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPassStateImplCopyWith<_$ResetPassStateImpl> get copyWith =>
      __$$ResetPassStateImplCopyWithImpl<_$ResetPassStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ResetPassState implements ResetPassState {
  const factory _ResetPassState({
    final FormzSubmissionStatus formzStatus,
    final ResetPassTokenModel? resetPassToken,
  }) = _$ResetPassStateImpl;

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  ResetPassTokenModel? get resetPassToken;

  /// Create a copy of ResetPassState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPassStateImplCopyWith<_$ResetPassStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
