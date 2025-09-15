// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function() logout,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function()? logout,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function()? logout,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserFetchData value) fetchData,
    required TResult Function(UserLogout value) logout,
    required TResult Function(UserResetStatus value) resetStatus,
    required TResult Function(UserDispose value) dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserFetchData value)? fetchData,
    TResult? Function(UserLogout value)? logout,
    TResult? Function(UserResetStatus value)? resetStatus,
    TResult? Function(UserDispose value)? dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserFetchData value)? fetchData,
    TResult Function(UserLogout value)? logout,
    TResult Function(UserResetStatus value)? resetStatus,
    TResult Function(UserDispose value)? dispose,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserFetchDataImplCopyWith<$Res> {
  factory _$$UserFetchDataImplCopyWith(
    _$UserFetchDataImpl value,
    $Res Function(_$UserFetchDataImpl) then,
  ) = __$$UserFetchDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserFetchDataImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserFetchDataImpl>
    implements _$$UserFetchDataImplCopyWith<$Res> {
  __$$UserFetchDataImplCopyWithImpl(
    _$UserFetchDataImpl _value,
    $Res Function(_$UserFetchDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserFetchDataImpl implements UserFetchData {
  const _$UserFetchDataImpl();

  @override
  String toString() {
    return 'UserEvent.fetchData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserFetchDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function() logout,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return fetchData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function()? logout,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return fetchData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function()? logout,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (fetchData != null) {
      return fetchData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserFetchData value) fetchData,
    required TResult Function(UserLogout value) logout,
    required TResult Function(UserResetStatus value) resetStatus,
    required TResult Function(UserDispose value) dispose,
  }) {
    return fetchData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserFetchData value)? fetchData,
    TResult? Function(UserLogout value)? logout,
    TResult? Function(UserResetStatus value)? resetStatus,
    TResult? Function(UserDispose value)? dispose,
  }) {
    return fetchData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserFetchData value)? fetchData,
    TResult Function(UserLogout value)? logout,
    TResult Function(UserResetStatus value)? resetStatus,
    TResult Function(UserDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (fetchData != null) {
      return fetchData(this);
    }
    return orElse();
  }
}

abstract class UserFetchData implements UserEvent {
  const factory UserFetchData() = _$UserFetchDataImpl;
}

/// @nodoc
abstract class _$$UserLogoutImplCopyWith<$Res> {
  factory _$$UserLogoutImplCopyWith(
    _$UserLogoutImpl value,
    $Res Function(_$UserLogoutImpl) then,
  ) = __$$UserLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLogoutImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserLogoutImpl>
    implements _$$UserLogoutImplCopyWith<$Res> {
  __$$UserLogoutImplCopyWithImpl(
    _$UserLogoutImpl _value,
    $Res Function(_$UserLogoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserLogoutImpl implements UserLogout {
  const _$UserLogoutImpl();

  @override
  String toString() {
    return 'UserEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function() logout,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function()? logout,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function()? logout,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserFetchData value) fetchData,
    required TResult Function(UserLogout value) logout,
    required TResult Function(UserResetStatus value) resetStatus,
    required TResult Function(UserDispose value) dispose,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserFetchData value)? fetchData,
    TResult? Function(UserLogout value)? logout,
    TResult? Function(UserResetStatus value)? resetStatus,
    TResult? Function(UserDispose value)? dispose,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserFetchData value)? fetchData,
    TResult Function(UserLogout value)? logout,
    TResult Function(UserResetStatus value)? resetStatus,
    TResult Function(UserDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class UserLogout implements UserEvent {
  const factory UserLogout() = _$UserLogoutImpl;
}

/// @nodoc
abstract class _$$UserResetStatusImplCopyWith<$Res> {
  factory _$$UserResetStatusImplCopyWith(
    _$UserResetStatusImpl value,
    $Res Function(_$UserResetStatusImpl) then,
  ) = __$$UserResetStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserResetStatusImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserResetStatusImpl>
    implements _$$UserResetStatusImplCopyWith<$Res> {
  __$$UserResetStatusImplCopyWithImpl(
    _$UserResetStatusImpl _value,
    $Res Function(_$UserResetStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserResetStatusImpl implements UserResetStatus {
  const _$UserResetStatusImpl();

  @override
  String toString() {
    return 'UserEvent.resetStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserResetStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function() logout,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return resetStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function()? logout,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return resetStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function()? logout,
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
    required TResult Function(UserFetchData value) fetchData,
    required TResult Function(UserLogout value) logout,
    required TResult Function(UserResetStatus value) resetStatus,
    required TResult Function(UserDispose value) dispose,
  }) {
    return resetStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserFetchData value)? fetchData,
    TResult? Function(UserLogout value)? logout,
    TResult? Function(UserResetStatus value)? resetStatus,
    TResult? Function(UserDispose value)? dispose,
  }) {
    return resetStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserFetchData value)? fetchData,
    TResult Function(UserLogout value)? logout,
    TResult Function(UserResetStatus value)? resetStatus,
    TResult Function(UserDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (resetStatus != null) {
      return resetStatus(this);
    }
    return orElse();
  }
}

abstract class UserResetStatus implements UserEvent {
  const factory UserResetStatus() = _$UserResetStatusImpl;
}

/// @nodoc
abstract class _$$UserDisposeImplCopyWith<$Res> {
  factory _$$UserDisposeImplCopyWith(
    _$UserDisposeImpl value,
    $Res Function(_$UserDisposeImpl) then,
  ) = __$$UserDisposeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserDisposeImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserDisposeImpl>
    implements _$$UserDisposeImplCopyWith<$Res> {
  __$$UserDisposeImplCopyWithImpl(
    _$UserDisposeImpl _value,
    $Res Function(_$UserDisposeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserDisposeImpl implements UserDispose {
  const _$UserDisposeImpl();

  @override
  String toString() {
    return 'UserEvent.dispose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserDisposeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchData,
    required TResult Function() logout,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchData,
    TResult? Function()? logout,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchData,
    TResult Function()? logout,
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
    required TResult Function(UserFetchData value) fetchData,
    required TResult Function(UserLogout value) logout,
    required TResult Function(UserResetStatus value) resetStatus,
    required TResult Function(UserDispose value) dispose,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserFetchData value)? fetchData,
    TResult? Function(UserLogout value)? logout,
    TResult? Function(UserResetStatus value)? resetStatus,
    TResult? Function(UserDispose value)? dispose,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserFetchData value)? fetchData,
    TResult Function(UserLogout value)? logout,
    TResult Function(UserResetStatus value)? resetStatus,
    TResult Function(UserDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class UserDispose implements UserEvent {
  const factory UserDispose() = _$UserDisposeImpl;
}

/// @nodoc
mixin _$UserState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call({FormzSubmissionStatus formzStatus, UserModel? user});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? formzStatus = null, Object? user = freezed}) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            user:
                freezed == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as UserModel?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
    _$UserStateImpl value,
    $Res Function(_$UserStateImpl) then,
  ) = __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FormzSubmissionStatus formzStatus, UserModel? user});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
    _$UserStateImpl _value,
    $Res Function(_$UserStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? formzStatus = null, Object? user = freezed}) {
    return _then(
      _$UserStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        user:
            freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as UserModel?,
      ),
    );
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    this.user,
  });

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'UserState(formzStatus: $formzStatus, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formzStatus, user);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState({
    final FormzSubmissionStatus formzStatus,
    final UserModel? user,
  }) = _$UserStateImpl;

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  UserModel? get user;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
