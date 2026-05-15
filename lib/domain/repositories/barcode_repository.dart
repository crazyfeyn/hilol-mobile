import 'package:commerce_mobile/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class BarcodeRepository {
  Future<Either<String, ProductModel>> fetchProductByBarcode(String code);

  void dispose();
}
