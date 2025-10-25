import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/data/models/product_category_model.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/data/repositories/product_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = ProductRepositoryImpl();

  List<ProductModel> allProducts = [];
  HomeBloc() : super(const HomeState()) {
    on<HomeFetchBanners>((event, emit) async {});

    on<HomeFetchCategories>((event, emit) async {
      FormzSubmissionStatus categoryStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(categoryStatus: categoryStatus));

      List<ProductCategoryModel> categories = [];
      final result = await _repository.fetchAllCategories();
      if(result.isRight()) {
        categories = result.getOrElse(() => throw Exception("Unexpected error"));
        categoryStatus = FormzSubmissionStatus.success;
      } else {
        categoryStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(categories: categories, categoryStatus: categoryStatus));
    });

    on<HomeFetchProducts>((event, emit) async {
      List<ProductModel> products = [];
      FormzSubmissionStatus productStatus = FormzSubmissionStatus.inProgress;
      emit(state.copyWith(selectCategoryId: event.categoryId, productStatus: productStatus));

      late final result;
      if(event.categoryId == null) {
        result = await _repository.fetchAllProducts();
      } else {
        result = await _repository.fetchProductsByCategory(event.categoryId!);
      }
      if(result.isRight()) {
        allProducts = result.getOrElse(() => throw Exception("Unexpected error"));
        productStatus = FormzSubmissionStatus.success;
        products = allProducts;
      } else {
        productStatus = FormzSubmissionStatus.failure;
      }

      emit(state.copyWith(products: products, productStatus: productStatus));
    });

    on<HomeSearchProducts>((event, emit) async {
      final products = allProducts.where((product) {
        return (product.title?.toLowerCase() ?? "").contains(event.text.toLowerCase());
      }).toList();

      emit(state.copyWith(products: products));
    });

    on<HomeDispose>((event, emit) => _repository.dispose());
  }
}
