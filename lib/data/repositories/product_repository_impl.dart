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

  String _getDownloadUrl(String identity) {
    return "${NetworkService.getService}${NetworkService.apiFileDownload}?identity=$identity";
  }

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
      final products =
          data.map((json) {
            final product = ProductModel.fromJson(json);
            // Map all image identities -> download URLs
            final updatedImages =
                product.images
                    .map((identity) => _getDownloadUrl(identity))
                    .toList();
            return product.copyWith(images: updatedImages);
          }).toList();

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
      final product = ProductModel.fromJson(data);
      final updatedImages =
          product.images.map((identity) => _getDownloadUrl(identity)).toList();

      return Right(product.copyWith(images: updatedImages));
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
      final products =
          data.map((json) {
            final product = ProductModel.fromJson(json);
            final updatedImages =
                product.images
                    .map((identity) => _getDownloadUrl(identity))
                    .toList();
            return product.copyWith(images: updatedImages);
          }).toList();

      return Right(products);
    } catch (e) {
      GlobalSnackBar.showError(e.toString());
      return Left(e.toString());
    }
  }
}
