// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  PaymentMethod get method => throw _privateConstructorUsedError;
  List<PaymentMethodModel> get methods => throw _privateConstructorUsedError;
  OrderData get order => throw _privateConstructorUsedError;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentStateCopyWith<PaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
    PaymentState value,
    $Res Function(PaymentState) then,
  ) = _$PaymentStateCopyWithImpl<$Res, PaymentState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    PaymentMethod method,
    List<PaymentMethodModel> methods,
    OrderData order,
  });
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? method = null,
    Object? methods = null,
    Object? order = null,
  }) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            method:
                null == method
                    ? _value.method
                    : method // ignore: cast_nullable_to_non_nullable
                        as PaymentMethod,
            methods:
                null == methods
                    ? _value.methods
                    : methods // ignore: cast_nullable_to_non_nullable
                        as List<PaymentMethodModel>,
            order:
                null == order
                    ? _value.order
                    : order // ignore: cast_nullable_to_non_nullable
                        as OrderData,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentStateImplCopyWith<$Res>
    implements $PaymentStateCopyWith<$Res> {
  factory _$$PaymentStateImplCopyWith(
    _$PaymentStateImpl value,
    $Res Function(_$PaymentStateImpl) then,
  ) = __$$PaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    PaymentMethod method,
    List<PaymentMethodModel> methods,
    OrderData order,
  });
}

/// @nodoc
class __$$PaymentStateImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$PaymentStateImpl>
    implements _$$PaymentStateImplCopyWith<$Res> {
  __$$PaymentStateImplCopyWithImpl(
    _$PaymentStateImpl _value,
    $Res Function(_$PaymentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? method = null,
    Object? methods = null,
    Object? order = null,
  }) {
    return _then(
      _$PaymentStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        method:
            null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                    as PaymentMethod,
        methods:
            null == methods
                ? _value._methods
                : methods // ignore: cast_nullable_to_non_nullable
                    as List<PaymentMethodModel>,
        order:
            null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                    as OrderData,
      ),
    );
  }
}

/// @nodoc

class _$PaymentStateImpl extends _PaymentState {
  const _$PaymentStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    this.method = PaymentMethod.tossBank,
    required final List<PaymentMethodModel> methods,
    required this.order,
  }) : _methods = methods,
       super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  @JsonKey()
  final PaymentMethod method;
  final List<PaymentMethodModel> _methods;
  @override
  List<PaymentMethodModel> get methods {
    if (_methods is EqualUnmodifiableListView) return _methods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_methods);
  }

  @override
  final OrderData order;

  @override
  String toString() {
    return 'PaymentState(formzStatus: $formzStatus, method: $method, methods: $methods, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other._methods, _methods) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    formzStatus,
    method,
    const DeepCollectionEquality().hash(_methods),
    order,
  );

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentStateImplCopyWith<_$PaymentStateImpl> get copyWith =>
      __$$PaymentStateImplCopyWithImpl<_$PaymentStateImpl>(this, _$identity);
}

abstract class _PaymentState extends PaymentState {
  const factory _PaymentState({
    final FormzSubmissionStatus formzStatus,
    final PaymentMethod method,
    required final List<PaymentMethodModel> methods,
    required final OrderData order,
  }) = _$PaymentStateImpl;
  const _PaymentState._() : super._();

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  PaymentMethod get method;
  @override
  List<PaymentMethodModel> get methods;
  @override
  OrderData get order;

  /// Create a copy of PaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentStateImplCopyWith<_$PaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
