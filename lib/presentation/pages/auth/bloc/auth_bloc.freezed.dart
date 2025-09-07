// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvents {

 RegisterUserModel get registerUserModel;
/// Create a copy of AuthEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventsCopyWith<AuthEvents> get copyWith => _$AuthEventsCopyWithImpl<AuthEvents>(this as AuthEvents, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvents&&(identical(other.registerUserModel, registerUserModel) || other.registerUserModel == registerUserModel));
}


@override
int get hashCode => Object.hash(runtimeType,registerUserModel);

@override
String toString() {
  return 'AuthEvents(registerUserModel: $registerUserModel)';
}


}

/// @nodoc
abstract mixin class $AuthEventsCopyWith<$Res>  {
  factory $AuthEventsCopyWith(AuthEvents value, $Res Function(AuthEvents) _then) = _$AuthEventsCopyWithImpl;
@useResult
$Res call({
 RegisterUserModel registerUserModel
});




}
/// @nodoc
class _$AuthEventsCopyWithImpl<$Res>
    implements $AuthEventsCopyWith<$Res> {
  _$AuthEventsCopyWithImpl(this._self, this._then);

  final AuthEvents _self;
  final $Res Function(AuthEvents) _then;

/// Create a copy of AuthEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registerUserModel = null,}) {
  return _then(_self.copyWith(
registerUserModel: null == registerUserModel ? _self.registerUserModel : registerUserModel // ignore: cast_nullable_to_non_nullable
as RegisterUserModel,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthEvents].
extension AuthEventsPatterns on AuthEvents {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RegisterEvent value)?  register,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterEvent() when register != null:
return register(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RegisterEvent value)  register,}){
final _that = this;
switch (_that) {
case _RegisterEvent():
return register(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RegisterEvent value)?  register,}){
final _that = this;
switch (_that) {
case _RegisterEvent() when register != null:
return register(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RegisterUserModel registerUserModel)?  register,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterEvent() when register != null:
return register(_that.registerUserModel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RegisterUserModel registerUserModel)  register,}) {final _that = this;
switch (_that) {
case _RegisterEvent():
return register(_that.registerUserModel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RegisterUserModel registerUserModel)?  register,}) {final _that = this;
switch (_that) {
case _RegisterEvent() when register != null:
return register(_that.registerUserModel);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterEvent implements AuthEvents {
  const _RegisterEvent({required this.registerUserModel});
  

@override final  RegisterUserModel registerUserModel;

/// Create a copy of AuthEvents
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterEventCopyWith<_RegisterEvent> get copyWith => __$RegisterEventCopyWithImpl<_RegisterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterEvent&&(identical(other.registerUserModel, registerUserModel) || other.registerUserModel == registerUserModel));
}


@override
int get hashCode => Object.hash(runtimeType,registerUserModel);

@override
String toString() {
  return 'AuthEvents.register(registerUserModel: $registerUserModel)';
}


}

/// @nodoc
abstract mixin class _$RegisterEventCopyWith<$Res> implements $AuthEventsCopyWith<$Res> {
  factory _$RegisterEventCopyWith(_RegisterEvent value, $Res Function(_RegisterEvent) _then) = __$RegisterEventCopyWithImpl;
@override @useResult
$Res call({
 RegisterUserModel registerUserModel
});




}
/// @nodoc
class __$RegisterEventCopyWithImpl<$Res>
    implements _$RegisterEventCopyWith<$Res> {
  __$RegisterEventCopyWithImpl(this._self, this._then);

  final _RegisterEvent _self;
  final $Res Function(_RegisterEvent) _then;

/// Create a copy of AuthEvents
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registerUserModel = null,}) {
  return _then(_RegisterEvent(
registerUserModel: null == registerUserModel ? _self.registerUserModel : registerUserModel // ignore: cast_nullable_to_non_nullable
as RegisterUserModel,
  ));
}


}

/// @nodoc
mixin _$AuthStates {

 Status get status; String? get message;
/// Create a copy of AuthStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStatesCopyWith<AuthStates> get copyWith => _$AuthStatesCopyWithImpl<AuthStates>(this as AuthStates, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStates&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'AuthStates(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthStatesCopyWith<$Res>  {
  factory $AuthStatesCopyWith(AuthStates value, $Res Function(AuthStates) _then) = _$AuthStatesCopyWithImpl;
@useResult
$Res call({
 Status status, String? message
});




}
/// @nodoc
class _$AuthStatesCopyWithImpl<$Res>
    implements $AuthStatesCopyWith<$Res> {
  _$AuthStatesCopyWithImpl(this._self, this._then);

  final AuthStates _self;
  final $Res Function(AuthStates) _then;

/// Create a copy of AuthStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthStates].
extension AuthStatesPatterns on AuthStates {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthStates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthStates() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthStates value)  $default,){
final _that = this;
switch (_that) {
case _AuthStates():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthStates value)?  $default,){
final _that = this;
switch (_that) {
case _AuthStates() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status status,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthStates() when $default != null:
return $default(_that.status,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status status,  String? message)  $default,) {final _that = this;
switch (_that) {
case _AuthStates():
return $default(_that.status,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status status,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _AuthStates() when $default != null:
return $default(_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _AuthStates implements AuthStates {
   _AuthStates({this.status = Status.initial, this.message});
  

@override@JsonKey() final  Status status;
@override final  String? message;

/// Create a copy of AuthStates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStatesCopyWith<_AuthStates> get copyWith => __$AuthStatesCopyWithImpl<_AuthStates>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStates&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,message);

@override
String toString() {
  return 'AuthStates(status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AuthStatesCopyWith<$Res> implements $AuthStatesCopyWith<$Res> {
  factory _$AuthStatesCopyWith(_AuthStates value, $Res Function(_AuthStates) _then) = __$AuthStatesCopyWithImpl;
@override @useResult
$Res call({
 Status status, String? message
});




}
/// @nodoc
class __$AuthStatesCopyWithImpl<$Res>
    implements _$AuthStatesCopyWith<$Res> {
  __$AuthStatesCopyWithImpl(this._self, this._then);

  final _AuthStates _self;
  final $Res Function(_AuthStates) _then;

/// Create a copy of AuthStates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = freezed,}) {
  return _then(_AuthStates(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
