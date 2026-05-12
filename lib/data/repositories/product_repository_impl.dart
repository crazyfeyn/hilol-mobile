import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/product_category_model.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:flutter/material.dart';

class ProductRepositoryImpl extends ProductRepository {
  late final CancelTokenManager cancelTokenManager;

  ProductRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  Future<Either<String, List<ProductCategoryModel>>>
  fetchAllCategories() async {
    try {
      final api = NetworkService.apiGetAllCategories;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken);

      final data = response['data']['list'] as List;
      final categories =
          data.map((json) => ProductCategoryModel.fromMap(json)).toList();
      return Right(categories);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> fetchAllProducts() async {
    try {
      final api = NetworkService.apiGetAllProducts;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken);

      final data = response['data']['list'] as List;
      final products = data.map((json) => ProductModel.fromMap(json)).toList();

      return Right(products);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductModel>> fetchProductById(int productId) async {
    try {
      final api = NetworkService.apiGetProductById;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken, {
        'productId': productId,
      });

      final data = response['data'];
      return Right(ProductModel.fromMap(data));
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e, st) {
      debugPrint('❌ fetchProductById: $e\n$st');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> fetchProductsByCategory(
    int categoryId,
  ) async {
    try {
      final api = NetworkService.apiGetProductsByCategory;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken, {
        'categoryId': categoryId,
      });

      final data = response['data']['list'] as List;
      final products = data.map((json) => ProductModel.fromMap(json)).toList();

      return Right(products);
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();
}
