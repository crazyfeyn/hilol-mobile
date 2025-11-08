// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel orderModel, String requestUUID)
    createOrder,
    required TResult Function(OrderModel orderModel) validateOrder,
    required TResult Function() resetOrder,
    required TResult Function() retryOrder,
    required TResult Function(List<CartModel> cartItems) calculateTotal,
    required TResult Function() clearError,
    required TResult Function() dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult? Function(OrderModel orderModel)? validateOrder,
    TResult? Function()? resetOrder,
    TResult? Function()? retryOrder,
    TResult? Function(List<CartModel> cartItems)? calculateTotal,
    TResult? Function()? clearError,
    TResult? Function()? dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult Function(OrderModel orderModel)? validateOrder,
    TResult Function()? resetOrder,
    TResult Function()? retryOrder,
    TResult Function(List<CartModel> cartItems)? calculateTotal,
    TResult Function()? clearError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderCreateRequested value) createOrder,
    required TResult Function(OrderValidationRequested value) validateOrder,
    required TResult Function(OrderResetRequested value) resetOrder,
    required TResult Function(OrderRetryRequested value) retryOrder,
    required TResult Function(OrderTotalCalculated value) calculateTotal,
    required TResult Function(OrderErrorCleared value) clearError,
    required TResult Function(OrderDisposed value) dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderCreateRequested value)? createOrder,
    TResult? Function(OrderValidationRequested value)? validateOrder,
    TResult? Function(OrderResetRequested value)? resetOrder,
    TResult? Function(OrderRetryRequested value)? retryOrder,
    TResult? Function(OrderTotalCalculated value)? calculateTotal,
    TResult? Function(OrderErrorCleared value)? clearError,
    TResult? Function(OrderDisposed value)? dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderCreateRequested value)? createOrder,
    TResult Function(OrderValidationRequested value)? validateOrder,
    TResult Function(OrderResetRequested value)? resetOrder,
    TResult Function(OrderRetryRequested value)? retryOrder,
    TResult Function(OrderTotalCalculated value)? calculateTotal,
    TResult Function(OrderErrorCleared value)? clearError,
    TResult Function(OrderDisposed value)? dispose,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
    OrderEvent value,
    $Res Function(OrderEvent) then,
  ) = _$OrderEventCopyWithImpl<$Res, OrderEvent>;
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OrderCreateRequestedImplCopyWith<$Res> {
  factory _$$OrderCreateRequestedImplCopyWith(
    _$OrderCreateRequestedImpl value,
    $Res Function(_$OrderCreateRequestedImpl) then,
  ) = __$$OrderCreateRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel orderModel, String requestUUID});
}

/// @nodoc
class __$$OrderCreateRequestedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderCreateRequestedImpl>
    implements _$$OrderCreateRequestedImplCopyWith<$Res> {
  __$$OrderCreateRequestedImplCopyWithImpl(
    _$OrderCreateRequestedImpl _value,
    $Res Function(_$OrderCreateRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderModel = null, Object? requestUUID = null}) {
    return _then(
      _$OrderCreateRequestedImpl(
        orderModel:
            null == orderModel
                ? _value.orderModel
                : orderModel // ignore: cast_nullable_to_non_nullable
                    as OrderModel,
        requestUUID:
            null == requestUUID
                ? _value.requestUUID
                : requestUUID // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$OrderCreateRequestedImpl implements OrderCreateRequested {
  const _$OrderCreateRequestedImpl({
    required this.orderModel,
    required this.requestUUID,
  });

  @override
  final OrderModel orderModel;
  @override
  final String requestUUID;

  @override
  String toString() {
    return 'OrderEvent.createOrder(orderModel: $orderModel, requestUUID: $requestUUID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreateRequestedImpl &&
            (identical(other.orderModel, orderModel) ||
                other.orderModel == orderModel) &&
            (identical(other.requestUUID, requestUUID) ||
                other.requestUUID == requestUUID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderModel, requestUUID);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreateRequestedImplCopyWith<_$OrderCreateRequestedImpl>
  get copyWith =>
      __$$OrderCreateRequestedImplCopyWithImpl<_$OrderCreateRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel orderModel, String requestUUID)
    createOrder,
    required TResult Function(OrderModel orderModel) validateOrder,
    required TResult Function() resetOrder,
    required TResult Function() retryOrder,
    required TResult Function(List<CartModel> cartItems) calculateTotal,
    required TResult Function() clearError,
    required TResult Function() dispose,
  }) {
    return createOrder(orderModel, requestUUID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult? Function(OrderModel orderModel)? validateOrder,
    TResult? Function()? resetOrder,
    TResult? Function()? retryOrder,
    TResult? Function(List<CartModel> cartItems)? calculateTotal,
    TResult? Function()? clearError,
    TResult? Function()? dispose,
  }) {
    return createOrder?.call(orderModel, requestUUID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult Function(OrderModel orderModel)? validateOrder,
    TResult Function()? resetOrder,
    TResult Function()? retryOrder,
    TResult Function(List<CartModel> cartItems)? calculateTotal,
    TResult Function()? clearError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder(orderModel, requestUUID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderCreateRequested value) createOrder,
    required TResult Function(OrderValidationRequested value) validateOrder,
    required TResult Function(OrderResetRequested value) resetOrder,
    required TResult Function(OrderRetryRequested value) retryOrder,
    required TResult Function(OrderTotalCalculated value) calculateTotal,
    required TResult Function(OrderErrorCleared value) clearError,
    required TResult Function(OrderDisposed value) dispose,
  }) {
    return createOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderCreateRequested value)? createOrder,
    TResult? Function(OrderValidationRequested value)? validateOrder,
    TResult? Function(OrderResetRequested value)? resetOrder,
    TResult? Function(OrderRetryRequested value)? retryOrder,
    TResult? Function(OrderTotalCalculated value)? calculateTotal,
    TResult? Function(OrderErrorCleared value)? clearError,
    TResult? Function(OrderDisposed value)? dispose,
  }) {
    return createOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderCreateRequested value)? createOrder,
    TResult Function(OrderValidationRequested value)? validateOrder,
    TResult Function(OrderResetRequested value)? resetOrder,
    TResult Function(OrderRetryRequested value)? retryOrder,
    TResult Function(OrderTotalCalculated value)? calculateTotal,
    TResult Function(OrderErrorCleared value)? clearError,
    TResult Function(OrderDisposed value)? dispose,
    required TResult orElse(),
  }) {
    if (createOrder != null) {
      return createOrder(this);
    }
    return orElse();
  }
}

abstract class OrderCreateRequested implements OrderEvent {
  const factory OrderCreateRequested({
    required final OrderModel orderModel,
    required final String requestUUID,
  }) = _$OrderCreateRequestedImpl;

  OrderModel get orderModel;
  String get requestUUID;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreateRequestedImplCopyWith<_$OrderCreateRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderValidationRequestedImplCopyWith<$Res> {
  factory _$$OrderValidationRequestedImplCopyWith(
    _$OrderValidationRequestedImpl value,
    $Res Function(_$OrderValidationRequestedImpl) then,
  ) = __$$OrderValidationRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel orderModel});
}

/// @nodoc
class __$$OrderValidationRequestedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderValidationRequestedImpl>
    implements _$$OrderValidationRequestedImplCopyWith<$Res> {
  __$$OrderValidationRequestedImplCopyWithImpl(
    _$OrderValidationRequestedImpl _value,
    $Res Function(_$OrderValidationRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderModel = null}) {
    return _then(
      _$OrderValidationRequestedImpl(
        orderModel:
            null == orderModel
                ? _value.orderModel
                : orderModel // ignore: cast_nullable_to_non_nullable
                    as OrderModel,
      ),
    );
  }
}

/// @nodoc

class _$OrderValidationRequestedImpl implements OrderValidationRequested {
  const _$OrderValidationRequestedImpl({required this.orderModel});

  @override
  final OrderModel orderModel;

  @override
  String toString() {
    return 'OrderEvent.validateOrder(orderModel: $orderModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderValidationRequestedImpl &&
            (identical(other.orderModel, orderModel) ||
                other.orderModel == orderModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderModel);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderValidationRequestedImplCopyWith<_$OrderValidationRequestedImpl>
  get copyWith => __$$OrderValidationRequestedImplCopyWithImpl<
    _$OrderValidationRequestedImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel orderModel, String requestUUID)
    createOrder,
    required TResult Function(OrderModel orderModel) validateOrder,
    required TResult Function() resetOrder,
    required TResult Function() retryOrder,
    required TResult Function(List<CartModel> cartItems) calculateTotal,
    required TResult Function() clearError,
    required TResult Function() dispose,
  }) {
    return validateOrder(orderModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult? Function(OrderModel orderModel)? validateOrder,
    TResult? Function()? resetOrder,
    TResult? Function()? retryOrder,
    TResult? Function(List<CartModel> cartItems)? calculateTotal,
    TResult? Function()? clearError,
    TResult? Function()? dispose,
  }) {
    return validateOrder?.call(orderModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult Function(OrderModel orderModel)? validateOrder,
    TResult Function()? resetOrder,
    TResult Function()? retryOrder,
    TResult Function(List<CartModel> cartItems)? calculateTotal,
    TResult Function()? clearError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (validateOrder != null) {
      return validateOrder(orderModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderCreateRequested value) createOrder,
    required TResult Function(OrderValidationRequested value) validateOrder,
    required TResult Function(OrderResetRequested value) resetOrder,
    required TResult Function(OrderRetryRequested value) retryOrder,
    required TResult Function(OrderTotalCalculated value) calculateTotal,
    required TResult Function(OrderErrorCleared value) clearError,
    required TResult Function(OrderDisposed value) dispose,
  }) {
    return validateOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderCreateRequested value)? createOrder,
    TResult? Function(OrderValidationRequested value)? validateOrder,
    TResult? Function(OrderResetRequested value)? resetOrder,
    TResult? Function(OrderRetryRequested value)? retryOrder,
    TResult? Function(OrderTotalCalculated value)? calculateTotal,
    TResult? Function(OrderErrorCleared value)? clearError,
    TResult? Function(OrderDisposed value)? dispose,
  }) {
    return validateOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderCreateRequested value)? createOrder,
    TResult Function(OrderValidationRequested value)? validateOrder,
    TResult Function(OrderResetRequested value)? resetOrder,
    TResult Function(OrderRetryRequested value)? retryOrder,
    TResult Function(OrderTotalCalculated value)? calculateTotal,
    TResult Function(OrderErrorCleared value)? clearError,
    TResult Function(OrderDisposed value)? dispose,
    required TResult orElse(),
  }) {
    if (validateOrder != null) {
      return validateOrder(this);
    }
    return orElse();
  }
}

abstract class OrderValidationRequested implements OrderEvent {
  const factory OrderValidationRequested({
    required final OrderModel orderModel,
  }) = _$OrderValidationRequestedImpl;

  OrderModel get orderModel;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderValidationRequestedImplCopyWith<_$OrderValidationRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderResetRequestedImplCopyWith<$Res> {
  factory _$$OrderResetRequestedImplCopyWith(
    _$OrderResetRequestedImpl value,
    $Res Function(_$OrderResetRequestedImpl) then,
  ) = __$$OrderResetRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderResetRequestedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderResetRequestedImpl>
    implements _$$OrderResetRequestedImplCopyWith<$Res> {
  __$$OrderResetRequestedImplCopyWithImpl(
    _$OrderResetRequestedImpl _value,
    $Res Function(_$OrderResetRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrderResetRequestedImpl implements OrderResetRequested {
  const _$OrderResetRequestedImpl();

  @override
  String toString() {
    return 'OrderEvent.resetOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderResetRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel orderModel, String requestUUID)
    createOrder,
    required TResult Function(OrderModel orderModel) validateOrder,
    required TResult Function() resetOrder,
    required TResult Function() retryOrder,
    required TResult Function(List<CartModel> cartItems) calculateTotal,
    required TResult Function() clearError,
    required TResult Function() dispose,
  }) {
    return resetOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult? Function(OrderModel orderModel)? validateOrder,
    TResult? Function()? resetOrder,
    TResult? Function()? retryOrder,
    TResult? Function(List<CartModel> cartItems)? calculateTotal,
    TResult? Function()? clearError,
    TResult? Function()? dispose,
  }) {
    return resetOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult Function(OrderModel orderModel)? validateOrder,
    TResult Function()? resetOrder,
    TResult Function()? retryOrder,
    TResult Function(List<CartModel> cartItems)? calculateTotal,
    TResult Function()? clearError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (resetOrder != null) {
      return resetOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderCreateRequested value) createOrder,
    required TResult Function(OrderValidationRequested value) validateOrder,
    required TResult Function(OrderResetRequested value) resetOrder,
    required TResult Function(OrderRetryRequested value) retryOrder,
    required TResult Function(OrderTotalCalculated value) calculateTotal,
    required TResult Function(OrderErrorCleared value) clearError,
    required TResult Function(OrderDisposed value) dispose,
  }) {
    return resetOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderCreateRequested value)? createOrder,
    TResult? Function(OrderValidationRequested value)? validateOrder,
    TResult? Function(OrderResetRequested value)? resetOrder,
    TResult? Function(OrderRetryRequested value)? retryOrder,
    TResult? Function(OrderTotalCalculated value)? calculateTotal,
    TResult? Function(OrderErrorCleared value)? clearError,
    TResult? Function(OrderDisposed value)? dispose,
  }) {
    return resetOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderCreateRequested value)? createOrder,
    TResult Function(OrderValidationRequested value)? validateOrder,
    TResult Function(OrderResetRequested value)? resetOrder,
    TResult Function(OrderRetryRequested value)? retryOrder,
    TResult Function(OrderTotalCalculated value)? calculateTotal,
    TResult Function(OrderErrorCleared value)? clearError,
    TResult Function(OrderDisposed value)? dispose,
    required TResult orElse(),
  }) {
    if (resetOrder != null) {
      return resetOrder(this);
    }
    return orElse();
  }
}

abstract class OrderResetRequested implements OrderEvent {
  const factory OrderResetRequested() = _$OrderResetRequestedImpl;
}

/// @nodoc
abstract class _$$OrderRetryRequestedImplCopyWith<$Res> {
  factory _$$OrderRetryRequestedImplCopyWith(
    _$OrderRetryRequestedImpl value,
    $Res Function(_$OrderRetryRequestedImpl) then,
  ) = __$$OrderRetryRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderRetryRequestedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderRetryRequestedImpl>
    implements _$$OrderRetryRequestedImplCopyWith<$Res> {
  __$$OrderRetryRequestedImplCopyWithImpl(
    _$OrderRetryRequestedImpl _value,
    $Res Function(_$OrderRetryRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrderRetryRequestedImpl implements OrderRetryRequested {
  const _$OrderRetryRequestedImpl();

  @override
  String toString() {
    return 'OrderEvent.retryOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderRetryRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel orderModel, String requestUUID)
    createOrder,
    required TResult Function(OrderModel orderModel) validateOrder,
    required TResult Function() resetOrder,
    required TResult Function() retryOrder,
    required TResult Function(List<CartModel> cartItems) calculateTotal,
    required TResult Function() clearError,
    required TResult Function() dispose,
  }) {
    return retryOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult? Function(OrderModel orderModel)? validateOrder,
    TResult? Function()? resetOrder,
    TResult? Function()? retryOrder,
    TResult? Function(List<CartModel> cartItems)? calculateTotal,
    TResult? Function()? clearError,
    TResult? Function()? dispose,
  }) {
    return retryOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult Function(OrderModel orderModel)? validateOrder,
    TResult Function()? resetOrder,
    TResult Function()? retryOrder,
    TResult Function(List<CartModel> cartItems)? calculateTotal,
    TResult Function()? clearError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (retryOrder != null) {
      return retryOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderCreateRequested value) createOrder,
    required TResult Function(OrderValidationRequested value) validateOrder,
    required TResult Function(OrderResetRequested value) resetOrder,
    required TResult Function(OrderRetryRequested value) retryOrder,
    required TResult Function(OrderTotalCalculated value) calculateTotal,
    required TResult Function(OrderErrorCleared value) clearError,
    required TResult Function(OrderDisposed value) dispose,
  }) {
    return retryOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderCreateRequested value)? createOrder,
    TResult? Function(OrderValidationRequested value)? validateOrder,
    TResult? Function(OrderResetRequested value)? resetOrder,
    TResult? Function(OrderRetryRequested value)? retryOrder,
    TResult? Function(OrderTotalCalculated value)? calculateTotal,
    TResult? Function(OrderErrorCleared value)? clearError,
    TResult? Function(OrderDisposed value)? dispose,
  }) {
    return retryOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderCreateRequested value)? createOrder,
    TResult Function(OrderValidationRequested value)? validateOrder,
    TResult Function(OrderResetRequested value)? resetOrder,
    TResult Function(OrderRetryRequested value)? retryOrder,
    TResult Function(OrderTotalCalculated value)? calculateTotal,
    TResult Function(OrderErrorCleared value)? clearError,
    TResult Function(OrderDisposed value)? dispose,
    required TResult orElse(),
  }) {
    if (retryOrder != null) {
      return retryOrder(this);
    }
    return orElse();
  }
}

abstract class OrderRetryRequested implements OrderEvent {
  const factory OrderRetryRequested() = _$OrderRetryRequestedImpl;
}

/// @nodoc
abstract class _$$OrderTotalCalculatedImplCopyWith<$Res> {
  factory _$$OrderTotalCalculatedImplCopyWith(
    _$OrderTotalCalculatedImpl value,
    $Res Function(_$OrderTotalCalculatedImpl) then,
  ) = __$$OrderTotalCalculatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CartModel> cartItems});
}

/// @nodoc
class __$$OrderTotalCalculatedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderTotalCalculatedImpl>
    implements _$$OrderTotalCalculatedImplCopyWith<$Res> {
  __$$OrderTotalCalculatedImplCopyWithImpl(
    _$OrderTotalCalculatedImpl _value,
    $Res Function(_$OrderTotalCalculatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartItems = null}) {
    return _then(
      _$OrderTotalCalculatedImpl(
        cartItems:
            null == cartItems
                ? _value._cartItems
                : cartItems // ignore: cast_nullable_to_non_nullable
                    as List<CartModel>,
      ),
    );
  }
}

/// @nodoc

class _$OrderTotalCalculatedImpl implements OrderTotalCalculated {
  const _$OrderTotalCalculatedImpl({required final List<CartModel> cartItems})
    : _cartItems = cartItems;

  final List<CartModel> _cartItems;
  @override
  List<CartModel> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  String toString() {
    return 'OrderEvent.calculateTotal(cartItems: $cartItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTotalCalculatedImpl &&
            const DeepCollectionEquality().equals(
              other._cartItems,
              _cartItems,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cartItems));

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTotalCalculatedImplCopyWith<_$OrderTotalCalculatedImpl>
  get copyWith =>
      __$$OrderTotalCalculatedImplCopyWithImpl<_$OrderTotalCalculatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel orderModel, String requestUUID)
    createOrder,
    required TResult Function(OrderModel orderModel) validateOrder,
    required TResult Function() resetOrder,
    required TResult Function() retryOrder,
    required TResult Function(List<CartModel> cartItems) calculateTotal,
    required TResult Function() clearError,
    required TResult Function() dispose,
  }) {
    return calculateTotal(cartItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult? Function(OrderModel orderModel)? validateOrder,
    TResult? Function()? resetOrder,
    TResult? Function()? retryOrder,
    TResult? Function(List<CartModel> cartItems)? calculateTotal,
    TResult? Function()? clearError,
    TResult? Function()? dispose,
  }) {
    return calculateTotal?.call(cartItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult Function(OrderModel orderModel)? validateOrder,
    TResult Function()? resetOrder,
    TResult Function()? retryOrder,
    TResult Function(List<CartModel> cartItems)? calculateTotal,
    TResult Function()? clearError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (calculateTotal != null) {
      return calculateTotal(cartItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderCreateRequested value) createOrder,
    required TResult Function(OrderValidationRequested value) validateOrder,
    required TResult Function(OrderResetRequested value) resetOrder,
    required TResult Function(OrderRetryRequested value) retryOrder,
    required TResult Function(OrderTotalCalculated value) calculateTotal,
    required TResult Function(OrderErrorCleared value) clearError,
    required TResult Function(OrderDisposed value) dispose,
  }) {
    return calculateTotal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderCreateRequested value)? createOrder,
    TResult? Function(OrderValidationRequested value)? validateOrder,
    TResult? Function(OrderResetRequested value)? resetOrder,
    TResult? Function(OrderRetryRequested value)? retryOrder,
    TResult? Function(OrderTotalCalculated value)? calculateTotal,
    TResult? Function(OrderErrorCleared value)? clearError,
    TResult? Function(OrderDisposed value)? dispose,
  }) {
    return calculateTotal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderCreateRequested value)? createOrder,
    TResult Function(OrderValidationRequested value)? validateOrder,
    TResult Function(OrderResetRequested value)? resetOrder,
    TResult Function(OrderRetryRequested value)? retryOrder,
    TResult Function(OrderTotalCalculated value)? calculateTotal,
    TResult Function(OrderErrorCleared value)? clearError,
    TResult Function(OrderDisposed value)? dispose,
    required TResult orElse(),
  }) {
    if (calculateTotal != null) {
      return calculateTotal(this);
    }
    return orElse();
  }
}

abstract class OrderTotalCalculated implements OrderEvent {
  const factory OrderTotalCalculated({
    required final List<CartModel> cartItems,
  }) = _$OrderTotalCalculatedImpl;

  List<CartModel> get cartItems;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTotalCalculatedImplCopyWith<_$OrderTotalCalculatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderErrorClearedImplCopyWith<$Res> {
  factory _$$OrderErrorClearedImplCopyWith(
    _$OrderErrorClearedImpl value,
    $Res Function(_$OrderErrorClearedImpl) then,
  ) = __$$OrderErrorClearedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderErrorClearedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderErrorClearedImpl>
    implements _$$OrderErrorClearedImplCopyWith<$Res> {
  __$$OrderErrorClearedImplCopyWithImpl(
    _$OrderErrorClearedImpl _value,
    $Res Function(_$OrderErrorClearedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrderErrorClearedImpl implements OrderErrorCleared {
  const _$OrderErrorClearedImpl();

  @override
  String toString() {
    return 'OrderEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderErrorClearedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel orderModel, String requestUUID)
    createOrder,
    required TResult Function(OrderModel orderModel) validateOrder,
    required TResult Function() resetOrder,
    required TResult Function() retryOrder,
    required TResult Function(List<CartModel> cartItems) calculateTotal,
    required TResult Function() clearError,
    required TResult Function() dispose,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult? Function(OrderModel orderModel)? validateOrder,
    TResult? Function()? resetOrder,
    TResult? Function()? retryOrder,
    TResult? Function(List<CartModel> cartItems)? calculateTotal,
    TResult? Function()? clearError,
    TResult? Function()? dispose,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult Function(OrderModel orderModel)? validateOrder,
    TResult Function()? resetOrder,
    TResult Function()? retryOrder,
    TResult Function(List<CartModel> cartItems)? calculateTotal,
    TResult Function()? clearError,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderCreateRequested value) createOrder,
    required TResult Function(OrderValidationRequested value) validateOrder,
    required TResult Function(OrderResetRequested value) resetOrder,
    required TResult Function(OrderRetryRequested value) retryOrder,
    required TResult Function(OrderTotalCalculated value) calculateTotal,
    required TResult Function(OrderErrorCleared value) clearError,
    required TResult Function(OrderDisposed value) dispose,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderCreateRequested value)? createOrder,
    TResult? Function(OrderValidationRequested value)? validateOrder,
    TResult? Function(OrderResetRequested value)? resetOrder,
    TResult? Function(OrderRetryRequested value)? retryOrder,
    TResult? Function(OrderTotalCalculated value)? calculateTotal,
    TResult? Function(OrderErrorCleared value)? clearError,
    TResult? Function(OrderDisposed value)? dispose,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderCreateRequested value)? createOrder,
    TResult Function(OrderValidationRequested value)? validateOrder,
    TResult Function(OrderResetRequested value)? resetOrder,
    TResult Function(OrderRetryRequested value)? retryOrder,
    TResult Function(OrderTotalCalculated value)? calculateTotal,
    TResult Function(OrderErrorCleared value)? clearError,
    TResult Function(OrderDisposed value)? dispose,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class OrderErrorCleared implements OrderEvent {
  const factory OrderErrorCleared() = _$OrderErrorClearedImpl;
}

/// @nodoc
abstract class _$$OrderDisposedImplCopyWith<$Res> {
  factory _$$OrderDisposedImplCopyWith(
    _$OrderDisposedImpl value,
    $Res Function(_$OrderDisposedImpl) then,
  ) = __$$OrderDisposedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderDisposedImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$OrderDisposedImpl>
    implements _$$OrderDisposedImplCopyWith<$Res> {
  __$$OrderDisposedImplCopyWithImpl(
    _$OrderDisposedImpl _value,
    $Res Function(_$OrderDisposedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrderDisposedImpl implements OrderDisposed {
  const _$OrderDisposedImpl();

  @override
  String toString() {
    return 'OrderEvent.dispose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderDisposedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderModel orderModel, String requestUUID)
    createOrder,
    required TResult Function(OrderModel orderModel) validateOrder,
    required TResult Function() resetOrder,
    required TResult Function() retryOrder,
    required TResult Function(List<CartModel> cartItems) calculateTotal,
    required TResult Function() clearError,
    required TResult Function() dispose,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult? Function(OrderModel orderModel)? validateOrder,
    TResult? Function()? resetOrder,
    TResult? Function()? retryOrder,
    TResult? Function(List<CartModel> cartItems)? calculateTotal,
    TResult? Function()? clearError,
    TResult? Function()? dispose,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderModel orderModel, String requestUUID)? createOrder,
    TResult Function(OrderModel orderModel)? validateOrder,
    TResult Function()? resetOrder,
    TResult Function()? retryOrder,
    TResult Function(List<CartModel> cartItems)? calculateTotal,
    TResult Function()? clearError,
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
    required TResult Function(OrderCreateRequested value) createOrder,
    required TResult Function(OrderValidationRequested value) validateOrder,
    required TResult Function(OrderResetRequested value) resetOrder,
    required TResult Function(OrderRetryRequested value) retryOrder,
    required TResult Function(OrderTotalCalculated value) calculateTotal,
    required TResult Function(OrderErrorCleared value) clearError,
    required TResult Function(OrderDisposed value) dispose,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderCreateRequested value)? createOrder,
    TResult? Function(OrderValidationRequested value)? validateOrder,
    TResult? Function(OrderResetRequested value)? resetOrder,
    TResult? Function(OrderRetryRequested value)? retryOrder,
    TResult? Function(OrderTotalCalculated value)? calculateTotal,
    TResult? Function(OrderErrorCleared value)? clearError,
    TResult? Function(OrderDisposed value)? dispose,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderCreateRequested value)? createOrder,
    TResult Function(OrderValidationRequested value)? validateOrder,
    TResult Function(OrderResetRequested value)? resetOrder,
    TResult Function(OrderRetryRequested value)? retryOrder,
    TResult Function(OrderTotalCalculated value)? calculateTotal,
    TResult Function(OrderErrorCleared value)? clearError,
    TResult Function(OrderDisposed value)? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class OrderDisposed implements OrderEvent {
  const factory OrderDisposed() = _$OrderDisposedImpl;
}

/// @nodoc
mixin _$OrderState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  bool get isCreatingOrder => throw _privateConstructorUsedError;
  bool get isValidating => throw _privateConstructorUsedError;
  OrderModel? get orderModel => throw _privateConstructorUsedError;
  OrderData? get orderData => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  OrderModel? get failedOrder => throw _privateConstructorUsedError;
  bool get isOrderValid => throw _privateConstructorUsedError;
  bool get hasProducts => throw _privateConstructorUsedError;
  bool get hasReceiverInfo => throw _privateConstructorUsedError;
  bool get hasAddress => throw _privateConstructorUsedError;
  String? get requestUUID => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
    OrderState value,
    $Res Function(OrderState) then,
  ) = _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    bool isCreatingOrder,
    bool isValidating,
    OrderModel? orderModel,
    OrderData? orderData,
    String? errorMessage,
    OrderModel? failedOrder,
    bool isOrderValid,
    bool hasProducts,
    bool hasReceiverInfo,
    bool hasAddress,
    String? requestUUID,
    double totalPrice,
    String currency,
  });
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? isCreatingOrder = null,
    Object? isValidating = null,
    Object? orderModel = freezed,
    Object? orderData = freezed,
    Object? errorMessage = freezed,
    Object? failedOrder = freezed,
    Object? isOrderValid = null,
    Object? hasProducts = null,
    Object? hasReceiverInfo = null,
    Object? hasAddress = null,
    Object? requestUUID = freezed,
    Object? totalPrice = null,
    Object? currency = null,
  }) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            isCreatingOrder:
                null == isCreatingOrder
                    ? _value.isCreatingOrder
                    : isCreatingOrder // ignore: cast_nullable_to_non_nullable
                        as bool,
            isValidating:
                null == isValidating
                    ? _value.isValidating
                    : isValidating // ignore: cast_nullable_to_non_nullable
                        as bool,
            orderModel:
                freezed == orderModel
                    ? _value.orderModel
                    : orderModel // ignore: cast_nullable_to_non_nullable
                        as OrderModel?,
            orderData:
                freezed == orderData
                    ? _value.orderData
                    : orderData // ignore: cast_nullable_to_non_nullable
                        as OrderData?,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            failedOrder:
                freezed == failedOrder
                    ? _value.failedOrder
                    : failedOrder // ignore: cast_nullable_to_non_nullable
                        as OrderModel?,
            isOrderValid:
                null == isOrderValid
                    ? _value.isOrderValid
                    : isOrderValid // ignore: cast_nullable_to_non_nullable
                        as bool,
            hasProducts:
                null == hasProducts
                    ? _value.hasProducts
                    : hasProducts // ignore: cast_nullable_to_non_nullable
                        as bool,
            hasReceiverInfo:
                null == hasReceiverInfo
                    ? _value.hasReceiverInfo
                    : hasReceiverInfo // ignore: cast_nullable_to_non_nullable
                        as bool,
            hasAddress:
                null == hasAddress
                    ? _value.hasAddress
                    : hasAddress // ignore: cast_nullable_to_non_nullable
                        as bool,
            requestUUID:
                freezed == requestUUID
                    ? _value.requestUUID
                    : requestUUID // ignore: cast_nullable_to_non_nullable
                        as String?,
            totalPrice:
                null == totalPrice
                    ? _value.totalPrice
                    : totalPrice // ignore: cast_nullable_to_non_nullable
                        as double,
            currency:
                null == currency
                    ? _value.currency
                    : currency // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
    _$OrderStateImpl value,
    $Res Function(_$OrderStateImpl) then,
  ) = __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    bool isCreatingOrder,
    bool isValidating,
    OrderModel? orderModel,
    OrderData? orderData,
    String? errorMessage,
    OrderModel? failedOrder,
    bool isOrderValid,
    bool hasProducts,
    bool hasReceiverInfo,
    bool hasAddress,
    String? requestUUID,
    double totalPrice,
    String currency,
  });
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
    _$OrderStateImpl _value,
    $Res Function(_$OrderStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? isCreatingOrder = null,
    Object? isValidating = null,
    Object? orderModel = freezed,
    Object? orderData = freezed,
    Object? errorMessage = freezed,
    Object? failedOrder = freezed,
    Object? isOrderValid = null,
    Object? hasProducts = null,
    Object? hasReceiverInfo = null,
    Object? hasAddress = null,
    Object? requestUUID = freezed,
    Object? totalPrice = null,
    Object? currency = null,
  }) {
    return _then(
      _$OrderStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        isCreatingOrder:
            null == isCreatingOrder
                ? _value.isCreatingOrder
                : isCreatingOrder // ignore: cast_nullable_to_non_nullable
                    as bool,
        isValidating:
            null == isValidating
                ? _value.isValidating
                : isValidating // ignore: cast_nullable_to_non_nullable
                    as bool,
        orderModel:
            freezed == orderModel
                ? _value.orderModel
                : orderModel // ignore: cast_nullable_to_non_nullable
                    as OrderModel?,
        orderData:
            freezed == orderData
                ? _value.orderData
                : orderData // ignore: cast_nullable_to_non_nullable
                    as OrderData?,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        failedOrder:
            freezed == failedOrder
                ? _value.failedOrder
                : failedOrder // ignore: cast_nullable_to_non_nullable
                    as OrderModel?,
        isOrderValid:
            null == isOrderValid
                ? _value.isOrderValid
                : isOrderValid // ignore: cast_nullable_to_non_nullable
                    as bool,
        hasProducts:
            null == hasProducts
                ? _value.hasProducts
                : hasProducts // ignore: cast_nullable_to_non_nullable
                    as bool,
        hasReceiverInfo:
            null == hasReceiverInfo
                ? _value.hasReceiverInfo
                : hasReceiverInfo // ignore: cast_nullable_to_non_nullable
                    as bool,
        hasAddress:
            null == hasAddress
                ? _value.hasAddress
                : hasAddress // ignore: cast_nullable_to_non_nullable
                    as bool,
        requestUUID:
            freezed == requestUUID
                ? _value.requestUUID
                : requestUUID // ignore: cast_nullable_to_non_nullable
                    as String?,
        totalPrice:
            null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                    as double,
        currency:
            null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$OrderStateImpl extends _OrderState {
  const _$OrderStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    this.isCreatingOrder = false,
    this.isValidating = false,
    this.orderModel = null,
    this.orderData = null,
    this.errorMessage = null,
    this.failedOrder = null,
    this.isOrderValid = false,
    this.hasProducts = false,
    this.hasReceiverInfo = false,
    this.hasAddress = false,
    this.requestUUID = null,
    this.totalPrice = 0.0,
    this.currency = '',
  }) : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  @override
  @JsonKey()
  final bool isCreatingOrder;
  @override
  @JsonKey()
  final bool isValidating;
  @override
  @JsonKey()
  final OrderModel? orderModel;
  @override
  @JsonKey()
  final OrderData? orderData;
  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final OrderModel? failedOrder;
  @override
  @JsonKey()
  final bool isOrderValid;
  @override
  @JsonKey()
  final bool hasProducts;
  @override
  @JsonKey()
  final bool hasReceiverInfo;
  @override
  @JsonKey()
  final bool hasAddress;
  @override
  @JsonKey()
  final String? requestUUID;
  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'OrderState(formzStatus: $formzStatus, isCreatingOrder: $isCreatingOrder, isValidating: $isValidating, orderModel: $orderModel, orderData: $orderData, errorMessage: $errorMessage, failedOrder: $failedOrder, isOrderValid: $isOrderValid, hasProducts: $hasProducts, hasReceiverInfo: $hasReceiverInfo, hasAddress: $hasAddress, requestUUID: $requestUUID, totalPrice: $totalPrice, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            (identical(other.isCreatingOrder, isCreatingOrder) ||
                other.isCreatingOrder == isCreatingOrder) &&
            (identical(other.isValidating, isValidating) ||
                other.isValidating == isValidating) &&
            (identical(other.orderModel, orderModel) ||
                other.orderModel == orderModel) &&
            (identical(other.orderData, orderData) ||
                other.orderData == orderData) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.failedOrder, failedOrder) ||
                other.failedOrder == failedOrder) &&
            (identical(other.isOrderValid, isOrderValid) ||
                other.isOrderValid == isOrderValid) &&
            (identical(other.hasProducts, hasProducts) ||
                other.hasProducts == hasProducts) &&
            (identical(other.hasReceiverInfo, hasReceiverInfo) ||
                other.hasReceiverInfo == hasReceiverInfo) &&
            (identical(other.hasAddress, hasAddress) ||
                other.hasAddress == hasAddress) &&
            (identical(other.requestUUID, requestUUID) ||
                other.requestUUID == requestUUID) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    formzStatus,
    isCreatingOrder,
    isValidating,
    orderModel,
    orderData,
    errorMessage,
    failedOrder,
    isOrderValid,
    hasProducts,
    hasReceiverInfo,
    hasAddress,
    requestUUID,
    totalPrice,
    currency,
  );

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);
}

abstract class _OrderState extends OrderState {
  const factory _OrderState({
    final FormzSubmissionStatus formzStatus,
    final bool isCreatingOrder,
    final bool isValidating,
    final OrderModel? orderModel,
    final OrderData? orderData,
    final String? errorMessage,
    final OrderModel? failedOrder,
    final bool isOrderValid,
    final bool hasProducts,
    final bool hasReceiverInfo,
    final bool hasAddress,
    final String? requestUUID,
    final double totalPrice,
    final String currency,
  }) = _$OrderStateImpl;
  const _OrderState._() : super._();

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  bool get isCreatingOrder;
  @override
  bool get isValidating;
  @override
  OrderModel? get orderModel;
  @override
  OrderData? get orderData;
  @override
  String? get errorMessage;
  @override
  OrderModel? get failedOrder;
  @override
  bool get isOrderValid;
  @override
  bool get hasProducts;
  @override
  bool get hasReceiverInfo;
  @override
  bool get hasAddress;
  @override
  String? get requestUUID;
  @override
  double get totalPrice;
  @override
  String get currency;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
