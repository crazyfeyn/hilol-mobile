// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MyOrderState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  List<OrderData> get allOrders => throw _privateConstructorUsedError;
  List<OrderData> get newOrders => throw _privateConstructorUsedError;

  /// Create a copy of MyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyOrderStateCopyWith<MyOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyOrderStateCopyWith<$Res> {
  factory $MyOrderStateCopyWith(
    MyOrderState value,
    $Res Function(MyOrderState) then,
  ) = _$MyOrderStateCopyWithImpl<$Res, MyOrderState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    List<OrderData> allOrders,
    List<OrderData> newOrders,
  });
}

/// @nodoc
class _$MyOrderStateCopyWithImpl<$Res, $Val extends MyOrderState>
    implements $MyOrderStateCopyWith<$Res> {
  _$MyOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? allOrders = null,
    Object? newOrders = null,
  }) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            allOrders:
                null == allOrders
                    ? _value.allOrders
                    : allOrders // ignore: cast_nullable_to_non_nullable
                        as List<OrderData>,
            newOrders:
                null == newOrders
                    ? _value.newOrders
                    : newOrders // ignore: cast_nullable_to_non_nullable
                        as List<OrderData>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MyOrderStateImplCopyWith<$Res>
    implements $MyOrderStateCopyWith<$Res> {
  factory _$$MyOrderStateImplCopyWith(
    _$MyOrderStateImpl value,
    $Res Function(_$MyOrderStateImpl) then,
  ) = __$$MyOrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    List<OrderData> allOrders,
    List<OrderData> newOrders,
  });
}

/// @nodoc
class __$$MyOrderStateImplCopyWithImpl<$Res>
    extends _$MyOrderStateCopyWithImpl<$Res, _$MyOrderStateImpl>
    implements _$$MyOrderStateImplCopyWith<$Res> {
  __$$MyOrderStateImplCopyWithImpl(
    _$MyOrderStateImpl _value,
    $Res Function(_$MyOrderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? allOrders = null,
    Object? newOrders = null,
  }) {
    return _then(
      _$MyOrderStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        allOrders:
            null == allOrders
                ? _value._allOrders
                : allOrders // ignore: cast_nullable_to_non_nullable
                    as List<OrderData>,
        newOrders:
            null == newOrders
                ? _value._newOrders
                : newOrders // ignore: cast_nullable_to_non_nullable
                    as List<OrderData>,
      ),
    );
  }
}

/// @nodoc

class _$MyOrderStateImpl extends _MyOrderState {
  const _$MyOrderStateImpl({
    this.formzStatus = FormzSubmissionStatus.inProgress,
    final List<OrderData> allOrders = const [],
    final List<OrderData> newOrders = const [],
  }) : _allOrders = allOrders,
       _newOrders = newOrders,
       super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  final List<OrderData> _allOrders;
  @override
  @JsonKey()
  List<OrderData> get allOrders {
    if (_allOrders is EqualUnmodifiableListView) return _allOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allOrders);
  }

  final List<OrderData> _newOrders;
  @override
  @JsonKey()
  List<OrderData> get newOrders {
    if (_newOrders is EqualUnmodifiableListView) return _newOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newOrders);
  }

  @override
  String toString() {
    return 'MyOrderState(formzStatus: $formzStatus, allOrders: $allOrders, newOrders: $newOrders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyOrderStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            const DeepCollectionEquality().equals(
              other._allOrders,
              _allOrders,
            ) &&
            const DeepCollectionEquality().equals(
              other._newOrders,
              _newOrders,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    formzStatus,
    const DeepCollectionEquality().hash(_allOrders),
    const DeepCollectionEquality().hash(_newOrders),
  );

  /// Create a copy of MyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyOrderStateImplCopyWith<_$MyOrderStateImpl> get copyWith =>
      __$$MyOrderStateImplCopyWithImpl<_$MyOrderStateImpl>(this, _$identity);
}

abstract class _MyOrderState extends MyOrderState {
  const factory _MyOrderState({
    final FormzSubmissionStatus formzStatus,
    final List<OrderData> allOrders,
    final List<OrderData> newOrders,
  }) = _$MyOrderStateImpl;
  const _MyOrderState._() : super._();

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  List<OrderData> get allOrders;
  @override
  List<OrderData> get newOrders;

  /// Create a copy of MyOrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyOrderStateImplCopyWith<_$MyOrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
