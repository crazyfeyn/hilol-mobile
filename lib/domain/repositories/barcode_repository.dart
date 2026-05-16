import 'package:commerce_mobile/data/models/barcode_product_model.dart';
import 'package:dartz/dartz.dart';

abstract class BarcodeRepository {
  Future<Either<String, BarcodeProductModel>> fetchProductByBarcode(
    String code,
  );
  void dispose();
}
