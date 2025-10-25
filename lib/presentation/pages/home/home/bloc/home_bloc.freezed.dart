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
mixin _$HomeState {
  FormzSubmissionStatus get bannerStatus => throw _privateConstructorUsedError;
  FormzSubmissionStatus get categoryStatus =>
      throw _privateConstructorUsedError;
  List<ProductCategoryModel> get categories =>
      throw _privateConstructorUsedError;
  int? get selectCategoryId => throw _privateConstructorUsedError;
  FormzSubmissionStatus get productStatus => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;

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
    FormzSubmissionStatus bannerStatus,
    FormzSubmissionStatus categoryStatus,
    List<ProductCategoryModel> categories,
    int? selectCategoryId,
    FormzSubmissionStatus productStatus,
    List<ProductModel> products,
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
    Object? bannerStatus = null,
    Object? categoryStatus = null,
    Object? categories = null,
    Object? selectCategoryId = freezed,
    Object? productStatus = null,
    Object? products = null,
  }) {
    return _then(
      _value.copyWith(
            bannerStatus:
                null == bannerStatus
                    ? _value.bannerStatus
                    : bannerStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            categoryStatus:
                null == categoryStatus
                    ? _value.categoryStatus
                    : categoryStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            categories:
                null == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<ProductCategoryModel>,
            selectCategoryId:
                freezed == selectCategoryId
                    ? _value.selectCategoryId
                    : selectCategoryId // ignore: cast_nullable_to_non_nullable
                        as int?,
            productStatus:
                null == productStatus
                    ? _value.productStatus
                    : productStatus // ignore: cast_nullable_to_non_nullable
                        as FormzSubmissionStatus,
            products:
                null == products
                    ? _value.products
                    : products // ignore: cast_nullable_to_non_nullable
                        as List<ProductModel>,
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
    FormzSubmissionStatus bannerStatus,
    FormzSubmissionStatus categoryStatus,
    List<ProductCategoryModel> categories,
    int? selectCategoryId,
    FormzSubmissionStatus productStatus,
    List<ProductModel> products,
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
    Object? bannerStatus = null,
    Object? categoryStatus = null,
    Object? categories = null,
    Object? selectCategoryId = freezed,
    Object? productStatus = null,
    Object? products = null,
  }) {
    return _then(
      _$HomeStateImpl(
        bannerStatus:
            null == bannerStatus
                ? _value.bannerStatus
                : bannerStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        categoryStatus:
            null == categoryStatus
                ? _value.categoryStatus
                : categoryStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<ProductCategoryModel>,
        selectCategoryId:
            freezed == selectCategoryId
                ? _value.selectCategoryId
                : selectCategoryId // ignore: cast_nullable_to_non_nullable
                    as int?,
        productStatus:
            null == productStatus
                ? _value.productStatus
                : productStatus // ignore: cast_nullable_to_non_nullable
                    as FormzSubmissionStatus,
        products:
            null == products
                ? _value._products
                : products // ignore: cast_nullable_to_non_nullable
                    as List<ProductModel>,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl({
    this.bannerStatus = FormzSubmissionStatus.inProgress,
    this.categoryStatus = FormzSubmissionStatus.inProgress,
    final List<ProductCategoryModel> categories = const [],
    this.selectCategoryId = null,
    this.productStatus = FormzSubmissionStatus.inProgress,
    final List<ProductModel> products = const [],
  }) : _categories = categories,
       _products = products,
       super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus bannerStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus categoryStatus;
  final List<ProductCategoryModel> _categories;
  @override
  @JsonKey()
  List<ProductCategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final int? selectCategoryId;
  @override
  @JsonKey()
  final FormzSubmissionStatus productStatus;
  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'HomeState(bannerStatus: $bannerStatus, categoryStatus: $categoryStatus, categories: $categories, selectCategoryId: $selectCategoryId, productStatus: $productStatus, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.bannerStatus, bannerStatus) ||
                other.bannerStatus == bannerStatus) &&
            (identical(other.categoryStatus, categoryStatus) ||
                other.categoryStatus == categoryStatus) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.selectCategoryId, selectCategoryId) ||
                other.selectCategoryId == selectCategoryId) &&
            (identical(other.productStatus, productStatus) ||
                other.productStatus == productStatus) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    bannerStatus,
    categoryStatus,
    const DeepCollectionEquality().hash(_categories),
    selectCategoryId,
    productStatus,
    const DeepCollectionEquality().hash(_products),
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState({
    final FormzSubmissionStatus bannerStatus,
    final FormzSubmissionStatus categoryStatus,
    final List<ProductCategoryModel> categories,
    final int? selectCategoryId,
    final FormzSubmissionStatus productStatus,
    final List<ProductModel> products,
  }) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  FormzSubmissionStatus get bannerStatus;
  @override
  FormzSubmissionStatus get categoryStatus;
  @override
  List<ProductCategoryModel> get categories;
  @override
  int? get selectCategoryId;
  @override
  FormzSubmissionStatus get productStatus;
  @override
  List<ProductModel> get products;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
