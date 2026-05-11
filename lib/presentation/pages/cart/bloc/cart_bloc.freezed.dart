// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CartState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get checkoutStatus =>
      throw _privateConstructorUsedError;
  List<CartModel> get carts => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get percent => throw _privateConstructorUsedError;
  int get removedCount => throw _privateConstructorUsedError;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    FormzSubmissionStatus checkoutStatus,
    List<CartModel> carts,
    double subtotal,
    double percent,
    int removedCount,
  });
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? checkoutStatus = null,
    Object? carts = null,
    Object? subtotal = null,
    Object? percent = null,
    Object? removedCount = null,
  }) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            checkoutStatus:
                null == checkoutStatus
                    ? _value.checkoutStatus
                    : checkoutStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            carts:
                null == carts
                    ? _value.carts
                    : carts // ignore: cast_nullable_to_non_nullable
                        as List<CartModel>,
            subtotal:
                null == subtotal
                    ? _value.subtotal
                    : subtotal // ignore: cast_nullable_to_non_nullable
                        as double,
            percent:
                null == percent
                    ? _value.percent
                    : percent // ignore: cast_nullable_to_non_nullable
                        as double,
            removedCount:
                null == removedCount
                    ? _value.removedCount
                    : removedCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
    _$CartStateImpl value,
    $Res Function(_$CartStateImpl) then,
  ) = __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    FormzSubmissionStatus checkoutStatus,
    List<CartModel> carts,
    double subtotal,
    double percent,
    int removedCount,
  });
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
    _$CartStateImpl _value,
    $Res Function(_$CartStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? checkoutStatus = null,
    Object? carts = null,
    Object? subtotal = null,
    Object? percent = null,
    Object? removedCount = null,
  }) {
    return _then(
      _$CartStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        checkoutStatus:
            null == checkoutStatus
                ? _value.checkoutStatus
                : checkoutStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        carts:
            null == carts
                ? _value._carts
                : carts // ignore: cast_nullable_to_non_nullable
                    as List<CartModel>,
        subtotal:
            null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                    as double,
        percent:
            null == percent
                ? _value.percent
                : percent // ignore: cast_nullable_to_non_nullable
                    as double,
        removedCount:
            null == removedCount
                ? _value.removedCount
                : removedCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$CartStateImpl extends _CartState {
  const _$CartStateImpl({
    this.formzStatus = FormzSubmissionStatus.inProgress,
    this.checkoutStatus = FormzSubmissionStatus.initial,
    final List<CartModel> carts = const [],
    this.subtotal = 0.0,
    this.percent = 0.0,
    this.removedCount = 0,
  }) : _carts = carts,
       super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus checkoutStatus;
  final List<CartModel> _carts;
  @override
  @JsonKey()
  List<CartModel> get carts {
    if (_carts is EqualUnmodifiableListView) return _carts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carts);
  }

  @override
  @JsonKey()
  final double subtotal;
  @override
  @JsonKey()
  final double percent;
  @override
  @JsonKey()
  final int removedCount;

  @override
  String toString() {
    return 'CartState(formzStatus: $formzStatus, checkoutStatus: $checkoutStatus, carts: $carts, subtotal: $subtotal, percent: $percent, removedCount: $removedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.checkoutStatus, checkoutStatus) ||
                other.checkoutStatus == checkoutStatus) &&
            const DeepCollectionEquality().equals(other._carts, _carts) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.removedCount, removedCount) ||
                other.removedCount == removedCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    formzStatus,
    checkoutStatus,
    const DeepCollectionEquality().hash(_carts),
    subtotal,
    percent,
    removedCount,
  );

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState({
    final FormzSubmissionStatus formzStatus,
    final FormzSubmissionStatus checkoutStatus,
    final List<CartModel> carts,
    final double subtotal,
    final double percent,
    final int removedCount,
  }) = _$CartStateImpl;
  const _CartState._() : super._();

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  FormzSubmissionStatus get checkoutStatus;
  @override
  List<CartModel> get carts;
  @override
  double get subtotal;
  @override
  double get percent;
  @override
  int get removedCount;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
