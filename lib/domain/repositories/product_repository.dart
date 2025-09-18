import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:commerce_mobile/data/models/product_category_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<String, ProductModel>> fetchProductById(int productId);

  Future<Either<String, List<ProductModel>>> fetchProductsByCategory(
    int categoryId,
  );

  Future<Either<String, List<ProductModel>>> fetchAllProducts();

  Future<Either<String, List<ProductCategoryModel>>> fetchAllCategories();

  void dispose();
}
