import 'package:commerce_mobile/core/services/lang_service.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/barcode_product_model.dart';
import 'package:commerce_mobile/domain/repositories/barcode_repository.dart';
import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class BarcodeRepositoryImpl extends BarcodeRepository {
  late final CancelTokenManager cancelTokenManager;

  BarcodeRepositoryImpl() {
    cancelTokenManager = CancelTokenManager();
  }

  @override
  Future<Either<String, BarcodeProductModel>> fetchProductByBarcode(
    String code,
  ) async {
    try {
      final api = NetworkService.apiBarcodeProductLookup;
      final cancelToken = cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken, {
        'code': code,
      });

      if (response['success'] == true) {
        return Right(BarcodeProductModel.fromMap(response['data']));
      }
      return Left('Product not found');
    } on NetworkException catch (e) {
      if (e.type != NetworkExceptionType.cancelled) {
        // GlobalSnackBar.showError(e.message);
      }
      return Left(e.toString());
    } catch (e, st) {
      debugPrint('❌ fetchProductByBarcode: $e\n$st');
      return Left(e.toString());
    }
  }

  @override
  void dispose() => cancelTokenManager.cancelAll();
}
