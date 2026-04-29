import 'package:commerce_mobile/core/utils/app_snackbar.dart';
import 'package:commerce_mobile/data/datasources/network/cancel_token_manager.dart';
import 'package:commerce_mobile/data/datasources/network/network_helper.dart';
import 'package:commerce_mobile/data/datasources/network/network_service.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';

class OrderRepositoryImpl extends OrderRepository {
  late final CancelTokenManager _cancelTokenManager;

  OrderRepositoryImpl() {
    _cancelTokenManager = CancelTokenManager();
  }

  @override
  Future<Either<String, List<OrderData>>> fetchMyOrders() async {
    try {
      final api = NetworkService.apiOrderFetchAllOrder;
      final cancelToken = _cancelTokenManager.getToken(api);
      final response = await NetworkService.get(api, cancelToken);

      final result =
          response['data']['list']
              .map<OrderData>((e) => OrderData.fromJson(e))
              .toList();
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
  Future<Either<String, OrderData>> fetchMyOrder(int id) async {
    try {
      final api = NetworkService.apiOrderFetchOrder;
      final cancelToken = _cancelTokenManager.getToken(api);
      final response = await NetworkService.get(
        api,
        cancelToken,
        NetworkService.paramsOrder(id),
      );

      final result = OrderData.fromJson(response['data']);
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
  Future<Either<String, bool>> cancelMyOrder(int id) async {
    try {
      final api = NetworkService.apiOrderCancel;
      final cancelToken = _cancelTokenManager.getToken(api);
      final response = await NetworkService.put(
        api,
        cancelToken,
        {},
        NetworkService.paramsOrderCancel(id),
      );

      final status = response["data"]['status'];
      final result = status == "CANCELLED";

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
  void dispose() => _cancelTokenManager.cancelAll();
}
