// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllProducts,
    required TResult Function(int categoryId) fetchProductByCategory,
    required TResult Function(int productId) fetchProductById,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAllProducts,
    TResult? Function(int categoryId)? fetchProductByCategory,
    TResult? Function(int productId)? fetchProductById,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllProducts,
    TResult Function(int categoryId)? fetchProductByCategory,
    TResult Function(int productId)? fetchProductById,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeFetchAllProducts value) fetchAllProducts,
    required TResult Function(HomeFetchProductByCategory value)
    fetchProductByCategory,
    required TResult Function(HomeFetchProductById value) fetchProductById,
    required TResult Function(HomeResetStatus value) resetStatus,
    required TResult Function(HomeDispose value) dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult? Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult? Function(HomeFetchProductById value)? fetchProductById,
    TResult? Function(HomeResetStatus value)? resetStatus,
    TResult? Function(HomeDispose value)? dispose,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult Function(HomeFetchProductById value)? fetchProductById,
    TResult Function(HomeResetStatus value)? resetStatus,
    TResult Function(HomeDispose value)? dispose,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeFetchAllProductsImplCopyWith<$Res> {
  factory _$$HomeFetchAllProductsImplCopyWith(
    _$HomeFetchAllProductsImpl value,
    $Res Function(_$HomeFetchAllProductsImpl) then,
  ) = __$$HomeFetchAllProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeFetchAllProductsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeFetchAllProductsImpl>
    implements _$$HomeFetchAllProductsImplCopyWith<$Res> {
  __$$HomeFetchAllProductsImplCopyWithImpl(
    _$HomeFetchAllProductsImpl _value,
    $Res Function(_$HomeFetchAllProductsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeFetchAllProductsImpl implements HomeFetchAllProducts {
  const _$HomeFetchAllProductsImpl();

  @override
  String toString() {
    return 'HomeEvent.fetchAllProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFetchAllProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllProducts,
    required TResult Function(int categoryId) fetchProductByCategory,
    required TResult Function(int productId) fetchProductById,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return fetchAllProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAllProducts,
    TResult? Function(int categoryId)? fetchProductByCategory,
    TResult? Function(int productId)? fetchProductById,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return fetchAllProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllProducts,
    TResult Function(int categoryId)? fetchProductByCategory,
    TResult Function(int productId)? fetchProductById,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (fetchAllProducts != null) {
      return fetchAllProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeFetchAllProducts value) fetchAllProducts,
    required TResult Function(HomeFetchProductByCategory value)
    fetchProductByCategory,
    required TResult Function(HomeFetchProductById value) fetchProductById,
    required TResult Function(HomeResetStatus value) resetStatus,
    required TResult Function(HomeDispose value) dispose,
  }) {
    return fetchAllProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult? Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult? Function(HomeFetchProductById value)? fetchProductById,
    TResult? Function(HomeResetStatus value)? resetStatus,
    TResult? Function(HomeDispose value)? dispose,
  }) {
    return fetchAllProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult Function(HomeFetchProductById value)? fetchProductById,
    TResult Function(HomeResetStatus value)? resetStatus,
    TResult Function(HomeDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (fetchAllProducts != null) {
      return fetchAllProducts(this);
    }
    return orElse();
  }
}

abstract class HomeFetchAllProducts implements HomeEvent {
  const factory HomeFetchAllProducts() = _$HomeFetchAllProductsImpl;
}

/// @nodoc
abstract class _$$HomeFetchProductByCategoryImplCopyWith<$Res> {
  factory _$$HomeFetchProductByCategoryImplCopyWith(
    _$HomeFetchProductByCategoryImpl value,
    $Res Function(_$HomeFetchProductByCategoryImpl) then,
  ) = __$$HomeFetchProductByCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$$HomeFetchProductByCategoryImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeFetchProductByCategoryImpl>
    implements _$$HomeFetchProductByCategoryImplCopyWith<$Res> {
  __$$HomeFetchProductByCategoryImplCopyWithImpl(
    _$HomeFetchProductByCategoryImpl _value,
    $Res Function(_$HomeFetchProductByCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = null}) {
    return _then(
      _$HomeFetchProductByCategoryImpl(
        null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$HomeFetchProductByCategoryImpl implements HomeFetchProductByCategory {
  const _$HomeFetchProductByCategoryImpl(this.categoryId);

  @override
  final int categoryId;

  @override
  String toString() {
    return 'HomeEvent.fetchProductByCategory(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFetchProductByCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFetchProductByCategoryImplCopyWith<_$HomeFetchProductByCategoryImpl>
  get copyWith => __$$HomeFetchProductByCategoryImplCopyWithImpl<
    _$HomeFetchProductByCategoryImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllProducts,
    required TResult Function(int categoryId) fetchProductByCategory,
    required TResult Function(int productId) fetchProductById,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return fetchProductByCategory(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAllProducts,
    TResult? Function(int categoryId)? fetchProductByCategory,
    TResult? Function(int productId)? fetchProductById,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return fetchProductByCategory?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllProducts,
    TResult Function(int categoryId)? fetchProductByCategory,
    TResult Function(int productId)? fetchProductById,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (fetchProductByCategory != null) {
      return fetchProductByCategory(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeFetchAllProducts value) fetchAllProducts,
    required TResult Function(HomeFetchProductByCategory value)
    fetchProductByCategory,
    required TResult Function(HomeFetchProductById value) fetchProductById,
    required TResult Function(HomeResetStatus value) resetStatus,
    required TResult Function(HomeDispose value) dispose,
  }) {
    return fetchProductByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult? Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult? Function(HomeFetchProductById value)? fetchProductById,
    TResult? Function(HomeResetStatus value)? resetStatus,
    TResult? Function(HomeDispose value)? dispose,
  }) {
    return fetchProductByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult Function(HomeFetchProductById value)? fetchProductById,
    TResult Function(HomeResetStatus value)? resetStatus,
    TResult Function(HomeDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (fetchProductByCategory != null) {
      return fetchProductByCategory(this);
    }
    return orElse();
  }
}

abstract class HomeFetchProductByCategory implements HomeEvent {
  const factory HomeFetchProductByCategory(final int categoryId) =
      _$HomeFetchProductByCategoryImpl;

  int get categoryId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeFetchProductByCategoryImplCopyWith<_$HomeFetchProductByCategoryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeFetchProductByIdImplCopyWith<$Res> {
  factory _$$HomeFetchProductByIdImplCopyWith(
    _$HomeFetchProductByIdImpl value,
    $Res Function(_$HomeFetchProductByIdImpl) then,
  ) = __$$HomeFetchProductByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$$HomeFetchProductByIdImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeFetchProductByIdImpl>
    implements _$$HomeFetchProductByIdImplCopyWith<$Res> {
  __$$HomeFetchProductByIdImplCopyWithImpl(
    _$HomeFetchProductByIdImpl _value,
    $Res Function(_$HomeFetchProductByIdImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null}) {
    return _then(
      _$HomeFetchProductByIdImpl(
        null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$HomeFetchProductByIdImpl implements HomeFetchProductById {
  const _$HomeFetchProductByIdImpl(this.productId);

  @override
  final int productId;

  @override
  String toString() {
    return 'HomeEvent.fetchProductById(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeFetchProductByIdImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeFetchProductByIdImplCopyWith<_$HomeFetchProductByIdImpl>
  get copyWith =>
      __$$HomeFetchProductByIdImplCopyWithImpl<_$HomeFetchProductByIdImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllProducts,
    required TResult Function(int categoryId) fetchProductByCategory,
    required TResult Function(int productId) fetchProductById,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return fetchProductById(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAllProducts,
    TResult? Function(int categoryId)? fetchProductByCategory,
    TResult? Function(int productId)? fetchProductById,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return fetchProductById?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllProducts,
    TResult Function(int categoryId)? fetchProductByCategory,
    TResult Function(int productId)? fetchProductById,
    TResult Function()? resetStatus,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (fetchProductById != null) {
      return fetchProductById(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeFetchAllProducts value) fetchAllProducts,
    required TResult Function(HomeFetchProductByCategory value)
    fetchProductByCategory,
    required TResult Function(HomeFetchProductById value) fetchProductById,
    required TResult Function(HomeResetStatus value) resetStatus,
    required TResult Function(HomeDispose value) dispose,
  }) {
    return fetchProductById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult? Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult? Function(HomeFetchProductById value)? fetchProductById,
    TResult? Function(HomeResetStatus value)? resetStatus,
    TResult? Function(HomeDispose value)? dispose,
  }) {
    return fetchProductById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult Function(HomeFetchProductById value)? fetchProductById,
    TResult Function(HomeResetStatus value)? resetStatus,
    TResult Function(HomeDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (fetchProductById != null) {
      return fetchProductById(this);
    }
    return orElse();
  }
}

abstract class HomeFetchProductById implements HomeEvent {
  const factory HomeFetchProductById(final int productId) =
      _$HomeFetchProductByIdImpl;

  int get productId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeFetchProductByIdImplCopyWith<_$HomeFetchProductByIdImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeResetStatusImplCopyWith<$Res> {
  factory _$$HomeResetStatusImplCopyWith(
    _$HomeResetStatusImpl value,
    $Res Function(_$HomeResetStatusImpl) then,
  ) = __$$HomeResetStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeResetStatusImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeResetStatusImpl>
    implements _$$HomeResetStatusImplCopyWith<$Res> {
  __$$HomeResetStatusImplCopyWithImpl(
    _$HomeResetStatusImpl _value,
    $Res Function(_$HomeResetStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeResetStatusImpl implements HomeResetStatus {
  const _$HomeResetStatusImpl();

  @override
  String toString() {
    return 'HomeEvent.resetStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeResetStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllProducts,
    required TResult Function(int categoryId) fetchProductByCategory,
    required TResult Function(int productId) fetchProductById,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return resetStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAllProducts,
    TResult? Function(int categoryId)? fetchProductByCategory,
    TResult? Function(int productId)? fetchProductById,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return resetStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllProducts,
    TResult Function(int categoryId)? fetchProductByCategory,
    TResult Function(int productId)? fetchProductById,
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
    required TResult Function(HomeFetchAllProducts value) fetchAllProducts,
    required TResult Function(HomeFetchProductByCategory value)
    fetchProductByCategory,
    required TResult Function(HomeFetchProductById value) fetchProductById,
    required TResult Function(HomeResetStatus value) resetStatus,
    required TResult Function(HomeDispose value) dispose,
  }) {
    return resetStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult? Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult? Function(HomeFetchProductById value)? fetchProductById,
    TResult? Function(HomeResetStatus value)? resetStatus,
    TResult? Function(HomeDispose value)? dispose,
  }) {
    return resetStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult Function(HomeFetchProductById value)? fetchProductById,
    TResult Function(HomeResetStatus value)? resetStatus,
    TResult Function(HomeDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (resetStatus != null) {
      return resetStatus(this);
    }
    return orElse();
  }
}

abstract class HomeResetStatus implements HomeEvent {
  const factory HomeResetStatus() = _$HomeResetStatusImpl;
}

/// @nodoc
abstract class _$$HomeDisposeImplCopyWith<$Res> {
  factory _$$HomeDisposeImplCopyWith(
    _$HomeDisposeImpl value,
    $Res Function(_$HomeDisposeImpl) then,
  ) = __$$HomeDisposeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeDisposeImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$HomeDisposeImpl>
    implements _$$HomeDisposeImplCopyWith<$Res> {
  __$$HomeDisposeImplCopyWithImpl(
    _$HomeDisposeImpl _value,
    $Res Function(_$HomeDisposeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeDisposeImpl implements HomeDispose {
  const _$HomeDisposeImpl();

  @override
  String toString() {
    return 'HomeEvent.dispose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeDisposeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAllProducts,
    required TResult Function(int categoryId) fetchProductByCategory,
    required TResult Function(int productId) fetchProductById,
    required TResult Function() resetStatus,
    required TResult Function() dispose,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAllProducts,
    TResult? Function(int categoryId)? fetchProductByCategory,
    TResult? Function(int productId)? fetchProductById,
    TResult? Function()? resetStatus,
    TResult? Function()? dispose,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAllProducts,
    TResult Function(int categoryId)? fetchProductByCategory,
    TResult Function(int productId)? fetchProductById,
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
    required TResult Function(HomeFetchAllProducts value) fetchAllProducts,
    required TResult Function(HomeFetchProductByCategory value)
    fetchProductByCategory,
    required TResult Function(HomeFetchProductById value) fetchProductById,
    required TResult Function(HomeResetStatus value) resetStatus,
    required TResult Function(HomeDispose value) dispose,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult? Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult? Function(HomeFetchProductById value)? fetchProductById,
    TResult? Function(HomeResetStatus value)? resetStatus,
    TResult? Function(HomeDispose value)? dispose,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeFetchAllProducts value)? fetchAllProducts,
    TResult Function(HomeFetchProductByCategory value)? fetchProductByCategory,
    TResult Function(HomeFetchProductById value)? fetchProductById,
    TResult Function(HomeResetStatus value)? resetStatus,
    TResult Function(HomeDispose value)? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class HomeDispose implements HomeEvent {
  const factory HomeDispose() = _$HomeDisposeImpl;
}

/// @nodoc
mixin _$HomeState {
  FormzSubmissionStatus get formzStatus => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    List<ProductModel> products,
    ProductModel? product,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? products = null,
    Object? product = freezed,
  }) {
    return _then(
      _value.copyWith(
            formzStatus:
                null == formzStatus
                    ? _value.formzStatus
                    : formzStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            products:
                null == products
                    ? _value.products
                    : products // ignore: cast_nullable_to_non_nullable
                        as List<ProductModel>,
            product:
                freezed == product
                    ? _value.product
                    : product // ignore: cast_nullable_to_non_nullable
                        as ProductModel?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FormzSubmissionStatus formzStatus,
    List<ProductModel> products,
    ProductModel? product,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formzStatus = null,
    Object? products = null,
    Object? product = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        formzStatus:
            null == formzStatus
                ? _value.formzStatus
                : formzStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<ProductModel>,
        product:
            freezed == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                    as ProductModel?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.formzStatus = FormzSubmissionStatus.initial,
    final List<ProductModel> products = const [],
    this.product,
  }) : _products = products;

  @override
  @JsonKey()
  final FormzSubmissionStatus formzStatus;
  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final ProductModel? product;

  @override
  String toString() {
    return 'HomeState(formzStatus: $formzStatus, products: $products, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.formzStatus, formzStatus) ||
                other.formzStatus == formzStatus) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    formzStatus,
    const DeepCollectionEquality().hash(_products),
    product,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final FormzSubmissionStatus formzStatus,
    final List<ProductModel> products,
    final ProductModel? product,
  }) = _$HomeStateImpl;

  @override
  FormzSubmissionStatus get formzStatus;
  @override
  List<ProductModel> get products;
  @override
  ProductModel? get product;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
