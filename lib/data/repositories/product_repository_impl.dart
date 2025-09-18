import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/product_category_model.dart';
import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';

class ProductRepositoryImpl extends ProductRepository {
  late final CancelTokenManager cancelTokenManager;

  ProductRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();

  @override
  Future<Either<String, List<ProductCategoryModel>>>
  fetchAllCategories() async {
    try {
      final api = NetworkService.apiGetAllCategories;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken);

      final data = response['data'] as List;
      final categories =
          data.map((json) => ProductCategoryModel.fromJson(json)).toList();
      return Right(categories);
    } catch (e) {
      GlobalSnackBar.showError(e.toString());
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
      final products = data.map((json) => ProductModel.fromJson(json)).toList();
      return Right(products);
    } catch (e) {
      GlobalSnackBar.showError(e.toString());
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
      return Right(ProductModel.fromJson(data));
    } catch (e) {
      GlobalSnackBar.showError(e.toString());
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
      final products = data.map((json) => ProductModel.fromJson(json)).toList();
      return Right(products);
    } catch (e) {
      GlobalSnackBar.showError(e.toString());
      return Left(e.toString());
    }
  }
}
