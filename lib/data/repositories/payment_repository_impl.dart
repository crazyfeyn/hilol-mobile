import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/payment_model.dart';
import 'package:commerce_mobile/domain/repositories/payment_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  late final CancelTokenManager _cancelTokenManager;

  PaymentRepositoryImpl() {
    _cancelTokenManager = CancelTokenManager();
  }

  @override
  Future<Either<String, bool>> confirmOrder(int id) async {
    try {
      final api = NetworkService.apiOrderConfirm;
      final cancelToken = _cancelTokenManager.getToken(api);
      final response = await NetworkService.put(
        api,
        cancelToken,
        null,
        NetworkService.paramsOrderConfirm(id),
      );
      final result = response["success"];
      return Right(result);
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
  Future<Either<String, CreatePaymentData>> createPayment(
    int id,
    String paymentMethod,
  ) async {
    try {
      final api = NetworkService.apiPaymentCreate;
      final cancelToken = _cancelTokenManager.getToken(api);
      final response = await NetworkService.post(
        api,
        cancelToken,
        NetworkService.paramsPaymentCreate(id, paymentMethod),
      );
      final result = CreatePaymentData.fromJson(response["data"] ?? {});
      return Right(result);
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
  Future<Either<String, bool>> confirmTossPayment(
    String paymentKey,
    String orderId,
    int amount,
  ) async {
    try {
      final api = NetworkService.apiPaymentConfirm;
      final cancelToken = _cancelTokenManager.getToken(api);
      await NetworkService.post(
        api,
        cancelToken,
        NetworkService.paramsPaymentConfirm(paymentKey, orderId, amount),
      );
      // Any 2xx response means the backend accepted the confirmation.
      return const Right(true);
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
  Future<Either<String, bool>> notifyTossFail(
    String code,
    String message,
    String orderId,
  ) async {
    try {
      final api = NetworkService.apiTossFail;
      final cancelToken = _cancelTokenManager.getToken(api);
      await NetworkService.get(
        api,
        cancelToken,
        NetworkService.paramsTossFail(code, message, orderId),
      );
      return const Right(true);
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
  void dispose() => _cancelTokenManager.cancelAll();
}
