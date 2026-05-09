import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/product_category_model.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/data/repositories/product_repository_impl.dart';
import 'package:easy_localization/easy_localization.dart' as context;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = ProductRepositoryImpl();

  /// In-memory cache to avoid re-fetching when switching tabs/routes.
  static List<ProductModel> cachedAllProducts = [];
  static List<ProductCategoryModel> cachedCategories = [];

  List<ProductModel> allProducts = [];

  HomeBloc()
      : super(
          HomeState(
            categories: cachedCategories,
            categoryStatus: cachedCategories.isNotEmpty
                ? FormzSubmissionStatus.success
                : FormzSubmissionStatus.inProgress,
            selectCategoryId: null,
            products: cachedAllProducts,
            productStatus: cachedAllProducts.isNotEmpty
                ? FormzSubmissionStatus.success
                : FormzSubmissionStatus.inProgress,
          ),
        ) {
    // Ensure search works even when state is initialized from cached products.
    allProducts = cachedAllProducts;

    on<HomeFetchBanners>((event, emit) async {});

    on<HomeRefreshAll>((event, emit) async {
      // Refresh everything from backend then update cache.
      emit(
        state.copyWith(
          categoryStatus: FormzSubmissionStatus.inProgress,
          productStatus: FormzSubmissionStatus.inProgress,
        ),
      );

      // 1) Categories
      List<ProductCategoryModel> categories = state.categories;
      FormzSubmissionStatus categoryStatus = FormzSubmissionStatus.failure;
      final catResult = await _repository.fetchAllCategories();
      if (catResult.isRight()) {
        categories = catResult.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        cachedCategories = categories;
        categoryStatus = FormzSubmissionStatus.success;
      }

      // 2) Products (always fetch all products on force refresh)
      List<ProductModel> products = state.products;
      FormzSubmissionStatus productStatus = FormzSubmissionStatus.failure;
      final prodResult = await _repository.fetchAllProducts();
      if (prodResult.isRight()) {
        products = prodResult.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        allProducts = products;
        cachedAllProducts = products;
        productStatus = FormzSubmissionStatus.success;
      }

      emit(
        state.copyWith(
          categories: categories,
          categoryStatus: categoryStatus,
          products: products,
          productStatus: productStatus,
          // Double-tap home should reset list back to "All products".
          selectCategoryId: null,
        ),
      );
    });

    on<HomeFetchCategories>((event, emit) async {
      FormzSubmissionStatus categoryStatus = FormzSubmissionStatus.inProgress;
      final existingCategories = state.categories;

      // If we already have categories cached, avoid unnecessary network calls.
      if (existingCategories.isNotEmpty) {
        emit(state.copyWith(categoryStatus: FormzSubmissionStatus.success));
        return;
      }

      emit(state.copyWith(categoryStatus: categoryStatus));

      List<ProductCategoryModel> categories = [];
      final result = await _repository.fetchAllCategories();
      if (result.isRight()) {
        categories = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        categoryStatus = FormzSubmissionStatus.success;
        cachedCategories = categories;
      } else {
        categoryStatus = FormzSubmissionStatus.failure;
      }

      emit(
        state.copyWith(
          categories: categoryStatus.isSuccess ? categories : existingCategories,
          categoryStatus: categoryStatus,
        ),
      );
    });

    on<HomeFetchProducts>((event, emit) async {
      FormzSubmissionStatus productStatus = FormzSubmissionStatus.inProgress;
      final existingProducts = state.products;
      final existingSelectCategoryId = state.selectCategoryId;

      // Only show loading shimmer if we don't already have products.
      if (existingProducts.isEmpty) {
        emit(state.copyWith(
          selectCategoryId: event.categoryId,
          productStatus: productStatus,
        ));
      }

      final result = event.categoryId == null
          ? await _repository.fetchAllProducts()
          : await _repository.fetchProductsByCategory(event.categoryId!);
      if (result.isRight()) {
        allProducts = result.getOrElse(
          () => throw Exception(context.tr(LocaleKeys.unexpected_error)),
        );
        productStatus = FormzSubmissionStatus.success;
        cachedAllProducts = allProducts;

        emit(
          state.copyWith(
            products: allProducts,
            productStatus: productStatus,
            selectCategoryId: event.categoryId,
          ),
        );
        return;
      } else {
        productStatus = FormzSubmissionStatus.failure;
      }

      // Preserve last known products when offline/API fails.
      emit(
        state.copyWith(
          products: existingProducts,
          productStatus: productStatus,
          selectCategoryId: existingSelectCategoryId,
        ),
      );
    });

    on<HomeSearchProducts>((event, emit) async {
      final products =
          allProducts.where((product) {
            return (product.localizedTitle?.toLowerCase() ?? "").contains(
              event.text.toLowerCase(),
            );
          }).toList();

      emit(state.copyWith(products: products));
    });

    on<HomeDispose>((event, emit) => _repository.dispose());
  }

  @override
  Future<void> close() {
    _repository.dispose();
    return super.close();
  }
}
